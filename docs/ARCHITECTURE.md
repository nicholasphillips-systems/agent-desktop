# Architecture & Design Philosophy

## The Linear Context Model

AI agents traditionally operate in isolated, stateless sessions. When an engineer switches between tasks or agent tools, context is fragmented. 

**Agent Desktop Suite** establishes a linear continuity layer across all tools:

```
┌────────────────────────────────────────────────────────┐
│                   NICK'S WORKSPACE                     │
│                                                        │
│  ~/AGENTS.md         ──▶ Universal Shared Rules        │
│  ~/ACTIVE_CONTEXT.md ──▶ Live State & Priority Brief   │
│  ~/Projects/Desks/   ──▶ Git Worktree Isolation        │
│  ~/.graphify/        ──▶ Central Knowledge Graph       │
│  ~/Notebooks/        ──▶ Durable Second Brain          │
└───────────┬────────────────────────────────────────────┘
            │
    ┌───────┴───────┬───────────────┬───────────────┐
    ▼               ▼               ▼               ▼
Claude Code    OpenAI Codex    Google Gemini   Hermes / Devin
```

### 1. The Pre-Flight Briefing (`agent-briefing`)
Whenever an agent icon is clicked, `agent-briefing` executes before the agent CLI or GUI initializes. It reads:
- `desk list`: Live ledger of claimed project folders and worktrees.
- `Master-Todo.md`: Highest-ranking personal and technical priorities.
- `PROJECTS.tsv`: Registered local repositories and short-names.
- `global-graph.json`: Central symbols and dependency relationships.

It generates an updated `~/ACTIVE_CONTEXT.md` in under 50ms and prints an ANSI status banner at the very top of the terminal scrollback buffer. When the agent reads its system instructions, it immediately discovers this file.

### 2. Multi-Agent Delegation Matrix
Rather than using one monolithic model for everything, each tool is treated as a specialized team member:
- **Claude Code**: Software architecture, front-end design, complex refactors, SVG generation.
- **OpenAI Codex**: Algorithmic correctness, API logic, automated unit testing.
- **Google Gemini**: Massive multi-repo ingestion, large log analysis, multi-document research.
- **Hermes Agent**: Local daemon orchestration, system automation, desktop tool execution.
- **Devin**: Autonomous end-to-end task execution.
- **OpenClaw**: Sandboxed VM execution for untrusted scripts or network tooling.
- **Browser-Use**: Autonomous browser navigation, DOM parsing, form submission.

### 3. File System Safety & Worktree Isolation (`desk`)
To prevent concurrent race conditions:
- **Look before touching**: Check `desk list` to see what is currently claimed.
- **Private Worktrees**: Starting work via `desk start <project> "<task>" <agent>` creates an isolated Git worktree in `~/Projects/Desks/`.
- **Merge & Sync**: When tests pass, `desk done <task>` merges changes back to main, removes the worktree, and runs `graphify update` to re-index changed symbols into the global knowledge graph.

### 4. Durable Memory vs Private Agent Memory
Individual tools have proprietary memory folders (e.g. `~/.claude/projects/`, `~/.codex/`). These are silos—no other agent can read them.
- Any finding that outlives the current session is written to the shared Second Brain (`~/Notebooks/Second Brain/`):
  - `Runs/`: Record completed deliverables and test outcomes.
  - `Decisions/`: Document architectural choices so subsequent agents don't second-guess them.
  - `Knowledge/` & `Systems/`: Document verified hardware and system realities.
