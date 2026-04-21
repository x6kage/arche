# Arche Knowledge Server

MCP (Model Context Protocol) server for tool-agnostic access to the Arche knowledge base.

## Tools

| Tool | Description |
|------|-------------|
| `knowledge_search` | Search articles by keyword |
| `knowledge_read` | Read a specific article |
| `knowledge_write` | Create/update with format validation |
| `knowledge_validate` | Check article format and freshness |
| `knowledge_curate` | Run a full Mnemon Pass |

## Setup

```bash
npm install
npm run build
```

## Integration

### Cursor IDE

Add to `.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "knowledge": {
      "command": "node",
      "args": ["/path/to/arche/mcp-server/dist/index.js"]
    }
  }
}
```

### Claude Desktop

Add to `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "knowledge": {
      "command": "node",
      "args": ["/path/to/arche/mcp-server/dist/index.js"]
    }
  }
}
```

## Development

```bash
npm run dev  # Run with tsx (hot reload)
```

## Article Validation

The `knowledge_write` tool enforces format compliance:

**Required metadata**: Last Updated, Confidence (HIGH/MEDIUM/LOW)

**Required sections**: Context, Key Findings, Evidence, Falsifiable Predictions, Corrections Log

**Optional sections**: Reasoning Chain, Alternatives Considered, Known Limitations, Summary

Articles that fail validation are rejected with specific error messages.
