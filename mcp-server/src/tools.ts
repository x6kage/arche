import { readFile, writeFile, readdir, mkdir } from "fs/promises";
import { join, relative } from "path";
import { existsSync } from "fs";
import { homedir } from "os";

// Resolve knowledge base paths
const GLOBAL_KNOWLEDGE_PATH =
  process.env.AI_DLC_KNOWLEDGE_PATH ||
  join(homedir(), "arche", "knowledge");

// Workspace-level knowledge directory candidates (checked in order)
const WORKSPACE_KNOWLEDGE_DIRS = [".cursor/knowledge", ".claude/knowledge", "knowledge"];

function getKnowledgePath(scope: string): string {
  if (scope === "global") {
    return GLOBAL_KNOWLEDGE_PATH;
  }
  // Workspace scope: walk up from cwd looking for any known knowledge dir
  let dir = process.cwd();
  while (dir !== "/") {
    for (const candidate of WORKSPACE_KNOWLEDGE_DIRS) {
      const full = join(dir, candidate);
      if (existsSync(full)) return full;
    }
    dir = join(dir, "..");
  }
  return join(process.cwd(), ".claude", "knowledge");
}

// Recursively list all .md files in a directory
async function listArticles(dir: string): Promise<string[]> {
  const results: string[] = [];
  if (!existsSync(dir)) return results;

  const entries = await readdir(dir, { withFileTypes: true });
  for (const entry of entries) {
    const fullPath = join(dir, entry.name);
    if (entry.isDirectory()) {
      results.push(...(await listArticles(fullPath)));
    } else if (entry.name.endsWith(".md") && entry.name !== "README.md") {
      results.push(fullPath);
    }
  }
  return results;
}

// Required sections for a valid knowledge article
const REQUIRED_SECTIONS = [
  "Context",
  "Key Findings",
  "Evidence",
  "Falsifiable Predictions",
  "Corrections Log",
];

const OPTIONAL_SECTIONS = [
  "Reasoning Chain",
  "Alternatives Considered",
  "Known Limitations",
  "Summary",
];

// Required metadata
const REQUIRED_METADATA = ["Last Updated", "Confidence"];

export async function searchKnowledge(
  query: string,
  scope: string
): Promise<string> {
  const scopes =
    scope === "all" ? ["global", "workspace"] : [scope];
  const queryLower = query.toLowerCase();
  const results: { path: string; excerpts: string[] }[] = [];

  for (const s of scopes) {
    const basePath = getKnowledgePath(s);
    const articles = await listArticles(basePath);

    for (const articlePath of articles) {
      try {
        const content = await readFile(articlePath, "utf-8");
        const lines = content.split("\n");
        const matchingLines: string[] = [];

        for (let i = 0; i < lines.length; i++) {
          if (lines[i].toLowerCase().includes(queryLower)) {
            // Include context: 1 line before and after
            const start = Math.max(0, i - 1);
            const end = Math.min(lines.length - 1, i + 1);
            const excerpt = lines
              .slice(start, end + 1)
              .map((l: string) => l.trim())
              .join("\n");
            matchingLines.push(`  L${i + 1}: ${excerpt}`);
          }
        }

        if (matchingLines.length > 0) {
          const relPath = relative(basePath, articlePath);
          results.push({
            path: `[${s}] ${relPath}`,
            excerpts: matchingLines.slice(0, 5), // Max 5 excerpts per file
          });
        }
      } catch {
        // Skip unreadable files
      }
    }
  }

  if (results.length === 0) {
    return `No results found for "${query}" in ${scope} knowledge base.`;
  }

  let output = `Found ${results.length} article(s) matching "${query}":\n\n`;
  for (const r of results) {
    output += `### ${r.path}\n`;
    output += r.excerpts.join("\n") + "\n\n";
  }
  return output;
}

export async function readArticle(
  article: string,
  scope: string
): Promise<string> {
  const basePath = getKnowledgePath(scope);
  const fullPath = join(basePath, article);

  if (!existsSync(fullPath)) {
    return `Article not found: ${article} (scope: ${scope})\nSearched in: ${basePath}`;
  }

  try {
    const content = await readFile(fullPath, "utf-8");
    return `# ${article} [${scope}]\n\n${content}`;
  } catch (error) {
    return `Error reading article: ${error}`;
  }
}

export async function writeArticle(
  article: string,
  content: string,
  scope: string
): Promise<string> {
  const basePath = getKnowledgePath(scope);
  const fullPath = join(basePath, article);

  // Validate format before writing
  const validation = validateContent(content);
  if (validation.errors.length > 0) {
    return `Validation failed. Fix these issues before writing:\n${validation.errors.map((e) => `  - ${e}`).join("\n")}`;
  }

  // Ensure directory exists
  const dir = join(fullPath, "..");
  await mkdir(dir, { recursive: true });

  // Write the file
  try {
    const existed = existsSync(fullPath);
    await writeFile(fullPath, content, "utf-8");
    return `${existed ? "Updated" : "Created"}: ${article} (scope: ${scope})\nValidation: PASSED (${validation.warnings.length} warnings)\n${validation.warnings.map((w) => `  ⚠ ${w}`).join("\n")}`;
  } catch (error) {
    return `Error writing article: ${error}`;
  }
}

function validateContent(content: string): {
  errors: string[];
  warnings: string[];
} {
  const errors: string[] = [];
  const warnings: string[] = [];

  // Check required metadata
  for (const meta of REQUIRED_METADATA) {
    if (!content.includes(`**${meta}**`)) {
      errors.push(`Missing required metadata: ${meta}`);
    }
  }

  // Check confidence level format
  if (content.includes("**Confidence**")) {
    const confMatch = content.match(
      /\*\*Confidence\*\*:\s*(HIGH|MEDIUM|LOW)/i
    );
    if (!confMatch) {
      errors.push(
        "Confidence must be HIGH, MEDIUM, or LOW"
      );
    }
  }

  // Check required sections
  for (const section of REQUIRED_SECTIONS) {
    // Look for ## Section or any heading level
    const pattern = new RegExp(`^#+\\s+${section}`, "mi");
    if (!pattern.test(content)) {
      errors.push(`Missing required section: ${section}`);
    }
  }

  // Check for Falsifiable Predictions content (not just header)
  const fpIndex = content.indexOf("Falsifiable Prediction");
  if (fpIndex !== -1) {
    const afterFP = content.slice(fpIndex, fpIndex + 500);
    if (!afterFP.includes("If ") && !afterFP.includes("if ")) {
      warnings.push(
        'Falsifiable Predictions section exists but may lack "If X, then Y" format'
      );
    }
  }

  // Check for Corrections Log table
  if (content.includes("Corrections Log")) {
    if (!content.includes("| Date")) {
      warnings.push(
        "Corrections Log should include a date-indexed table"
      );
    }
  }

  // Warn about missing optional sections
  for (const section of OPTIONAL_SECTIONS) {
    const pattern = new RegExp(`^#+\\s+${section}`, "mi");
    if (!pattern.test(content)) {
      warnings.push(`Missing optional section: ${section}`);
    }
  }

  return { errors, warnings };
}

export async function validateArticle(
  article: string,
  scope: string
): Promise<string> {
  const basePath = getKnowledgePath(scope);
  const fullPath = join(basePath, article);

  if (!existsSync(fullPath)) {
    return `Article not found: ${article} (scope: ${scope})`;
  }

  const content = await readFile(fullPath, "utf-8");
  const validation = validateContent(content);

  // Additional checks for existing articles

  // Check Last Updated freshness
  const dateMatch = content.match(
    /\*\*Last Updated\*\*:\s*(\d{4}-\d{2}-\d{2})/
  );
  if (dateMatch) {
    const updated = new Date(dateMatch[1]);
    const now = new Date();
    const daysSince = Math.floor(
      (now.getTime() - updated.getTime()) / (1000 * 60 * 60 * 24)
    );
    if (daysSince > 30) {
      validation.warnings.push(
        `Article last updated ${daysSince} days ago — may need review`
      );
    }
  }

  // Count sections
  const headings = content.match(/^#+\s+.+/gm) || [];

  let output = `Validation Report: ${article} [${scope}]\n\n`;
  output += `Sections found: ${headings.length}\n`;
  output += `Errors: ${validation.errors.length}\n`;
  output += `Warnings: ${validation.warnings.length}\n\n`;

  if (validation.errors.length > 0) {
    output += `ERRORS:\n${validation.errors.map((e) => `  ✗ ${e}`).join("\n")}\n\n`;
  }
  if (validation.warnings.length > 0) {
    output += `WARNINGS:\n${validation.warnings.map((w) => `  ⚠ ${w}`).join("\n")}\n\n`;
  }
  if (
    validation.errors.length === 0 &&
    validation.warnings.length === 0
  ) {
    output += "✓ All checks passed.\n";
  }

  return output;
}

export async function runCuratorPass(scope: string): Promise<string> {
  const scopes =
    scope === "all" ? ["global", "workspace"] : [scope];
  let report = `# Curator Pass Report\n\nDate: ${new Date().toISOString().split("T")[0]}\nScope: ${scope}\n\n`;

  let totalArticles = 0;
  let totalErrors = 0;
  let totalWarnings = 0;
  const articleResults: {
    path: string;
    errors: number;
    warnings: number;
    details: string;
  }[] = [];

  const confidenceCounts = { HIGH: 0, MEDIUM: 0, LOW: 0, UNKNOWN: 0 };
  const staleArticles: string[] = [];

  for (const s of scopes) {
    const basePath = getKnowledgePath(s);
    const articles = await listArticles(basePath);

    for (const articlePath of articles) {
      totalArticles++;
      const relPath = relative(basePath, articlePath);
      const content = await readFile(articlePath, "utf-8");
      const validation = validateContent(content);

      totalErrors += validation.errors.length;
      totalWarnings += validation.warnings.length;

      // Track confidence
      const confMatch = content.match(
        /\*\*Confidence\*\*:\s*(HIGH|MEDIUM|LOW)/i
      );
      if (confMatch) {
        confidenceCounts[
          confMatch[1].toUpperCase() as keyof typeof confidenceCounts
        ]++;
      } else {
        confidenceCounts.UNKNOWN++;
      }

      // Check staleness
      const dateMatch = content.match(
        /\*\*Last Updated\*\*:\s*(\d{4}-\d{2}-\d{2})/
      );
      if (dateMatch) {
        const updated = new Date(dateMatch[1]);
        const daysSince = Math.floor(
          (Date.now() - updated.getTime()) / (1000 * 60 * 60 * 24)
        );
        if (daysSince > 30) {
          staleArticles.push(`[${s}] ${relPath} (${daysSince} days)`);
        }
      }

      if (
        validation.errors.length > 0 ||
        validation.warnings.length > 0
      ) {
        articleResults.push({
          path: `[${s}] ${relPath}`,
          errors: validation.errors.length,
          warnings: validation.warnings.length,
          details: [
            ...validation.errors.map((e) => `  ✗ ${e}`),
            ...validation.warnings.map((w) => `  ⚠ ${w}`),
          ].join("\n"),
        });
      }
    }
  }

  // Build report
  report += `## Knowledge Base Health\n\n`;
  report += `- Total articles: ${totalArticles}\n`;
  report += `- HIGH confidence: ${confidenceCounts.HIGH}\n`;
  report += `- MEDIUM confidence: ${confidenceCounts.MEDIUM}\n`;
  report += `- LOW confidence: ${confidenceCounts.LOW}\n`;
  report += `- Unknown confidence: ${confidenceCounts.UNKNOWN}\n`;
  report += `- Total errors: ${totalErrors}\n`;
  report += `- Total warnings: ${totalWarnings}\n`;
  report += `- Stale articles (>30 days): ${staleArticles.length}\n\n`;

  if (staleArticles.length > 0) {
    report += `## Stale Articles\n\n`;
    for (const a of staleArticles) {
      report += `- ${a}\n`;
    }
    report += "\n";
  }

  if (articleResults.length > 0) {
    report += `## Articles Needing Attention\n\n`;
    for (const r of articleResults) {
      report += `### ${r.path} (${r.errors}E / ${r.warnings}W)\n`;
      report += `${r.details}\n\n`;
    }
  }

  if (totalErrors === 0 && totalWarnings === 0) {
    report += `## Status: ✓ All articles pass validation.\n`;
  }

  return report;
}
