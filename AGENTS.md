## Cursor Cloud specific instructions

### Project overview

Arche is an AI development lifecycle framework with a persistent knowledge layer. The only runnable service is the **MCP Knowledge Server** (`mcp-server/`), a Node.js/TypeScript stdio-based MCP server that provides knowledge search, read, write, validate, and curate tools.

### Services

| Service | How to run | Notes |
|---------|-----------|-------|
| MCP Knowledge Server (dev) | `cd mcp-server && npm run dev` | Uses `tsx` for hot reload; runs on stdio, not a port |
| MCP Knowledge Server (built) | `cd mcp-server && npm run build && npm start` | Compiles TS then runs `node dist/index.js` |
| setup.sh | `./setup.sh <target>` | One-shot distribution script; see `./setup.sh --help` |

### Key commands

- **Install deps:** `cd mcp-server && npm install`
- **Build:** `cd mcp-server && npm run build`
- **Type-check (lint):** `cd mcp-server && npx tsc --noEmit`
- **Dev mode:** `cd mcp-server && npm run dev`
- **Test MCP server manually:** pipe JSON-RPC messages to `node mcp-server/dist/index.js` on stdin (server uses stdio transport, not HTTP)

### Gotchas

- The MCP server uses **stdio transport**, not HTTP. To test it, pipe JSON-RPC messages via stdin. There is no port to curl.
- The knowledge base path defaults to `~/arche/knowledge` for global scope. In Cloud VMs this directory may not exist; set `AI_DLC_KNOWLEDGE_PATH` env var or use `scope: "workspace"` which finds `knowledge/` relative to cwd.
- There are no automated test suites in this repo. Validation is done via TypeScript type-checking (`tsc --noEmit`) and manual MCP protocol testing.
- `setup.sh` detects whether it's running from the repo root vs. a project directory. From the repo root it runs in "global-only" mode. Run it from a different directory to trigger workspace mode.
