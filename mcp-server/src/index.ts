#!/usr/bin/env node

import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import { z } from "zod";
import { searchKnowledge, readArticle, writeArticle, validateArticle, runCuratorPass } from "./tools.js";

const server = new McpServer({
  name: "arche-knowledge",
  version: "0.1.0",
});

// Tool: Search knowledge articles by keyword
server.tool(
  "knowledge_search",
  "Search knowledge articles by keyword or topic. Returns matching article paths and relevant excerpts.",
  {
    query: z.string().describe("Search term or topic to find in knowledge articles"),
    scope: z.enum(["global", "workspace", "all"]).default("all").describe("Search scope: global (~/.cursor/knowledge), workspace (.cursor/knowledge), or all"),
  },
  async ({ query, scope }) => {
    const results = await searchKnowledge(query, scope);
    return {
      content: [{ type: "text", text: results }],
    };
  }
);

// Tool: Read a specific knowledge article
server.tool(
  "knowledge_read",
  "Read the full content of a specific knowledge article.",
  {
    article: z.string().describe("Article path relative to knowledge root (e.g., 'meta/reasoning-pitfalls.md')"),
    scope: z.enum(["global", "workspace"]).default("global").describe("Which knowledge base to read from"),
  },
  async ({ article, scope }) => {
    const content = await readArticle(article, scope);
    return {
      content: [{ type: "text", text: content }],
    };
  }
);

// Tool: Write or update a knowledge article
server.tool(
  "knowledge_write",
  "Create or update a knowledge article. Validates format compliance before writing.",
  {
    article: z.string().describe("Article path relative to knowledge root (e.g., 'meta/new-insight.md')"),
    content: z.string().describe("Full markdown content of the article"),
    scope: z.enum(["global", "workspace"]).default("global").describe("Which knowledge base to write to"),
  },
  async ({ article, content, scope }) => {
    const result = await writeArticle(article, content, scope);
    return {
      content: [{ type: "text", text: result }],
    };
  }
);

// Tool: Validate a knowledge article
server.tool(
  "knowledge_validate",
  "Check a knowledge article for format compliance, evidence freshness, and structural completeness.",
  {
    article: z.string().describe("Article path relative to knowledge root"),
    scope: z.enum(["global", "workspace"]).default("global").describe("Which knowledge base to check"),
  },
  async ({ article, scope }) => {
    const result = await validateArticle(article, scope);
    return {
      content: [{ type: "text", text: result }],
    };
  }
);

// Tool: Run Curator Pass
server.tool(
  "knowledge_curate",
  "Run a Curator Pass: validate all articles, detect contradictions, suggest consolidation and pruning.",
  {
    scope: z.enum(["global", "workspace", "all"]).default("all").describe("Scope of curation"),
  },
  async ({ scope }) => {
    const result = await runCuratorPass(scope);
    return {
      content: [{ type: "text", text: result }],
    };
  }
);

// Start server
async function main() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
  console.error("Arche Knowledge Server running on stdio");
}

main().catch((error) => {
  console.error("Fatal error:", error);
  process.exit(1);
});
