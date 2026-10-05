# ⚡ Agent Desktop Suite
### A Unified Multi-Agent Cockpit with Linear Context for Linux

Turn your Linux workstation into an orchestrated multi-agent operating system. Click an icon on your desktop, and any AI agent—**Claude Code, OpenAI Codex, Google Gemini, Hermes, Devin, OpenCode, Qwen, Kilo, Cursor, OpenClaw, Cline, Aether, Browser-Use**—instantly opens in a fresh session with **complete context of who you are, the active work in progress, and the exact tools to delegate to**.

---

## The Problem
Most developers run multiple AI CLI agents and GUI environments side-by-side. But every session starts as an amnesiac:
- Agents don't know who you are or your working style.
- Agents don't know what previous agents just built, tested, or committed.
- One agent clobbers files another agent is currently modifying.
- Context is lost between session restarts, forcing you to re-explain everything.

## The Solution
**Agent Desktop Suite** bridges the gap with a clean, lightweight, zero-dependency architecture:

1. **One-Click Desktop Launchers**: Custom, high-resolution vector SVG icons and FreeDesktop `.desktop` launchers for 15+ AI systems.
2. **Dynamic Linear Context Engine (`agent-briefing`)**:
   - Gathers live worktree state (`desk list`), open master priorities, and project catalogs.
   - Automatically writes an updated `~/ACTIVE_CONTEXT.md` before the session launches.
   - Prints a formatted ANSI status banner directly in your terminal scrollback so you and the agent see current priorities.
3. **Multi-Agent Capabilities & Delegation Matrix**:
   - All agents read unified instructions (`~/AGENTS.md`) outlining the specific superpowers of each tool (e.g., Claude for refactoring/design, Codex for backend algorithms, Gemini for repo audits, Hermes for system daemon tasks, OpenClaw for VM-sandboxed scraping).
   - Enforces a clean worktree locking mechanism so agents share the filesystem harmoniously.
4. **Universal Terminal & Desktop Compatibility**:
   - Auto-detects terminal emulators: KDE Konsole, GNOME Terminal, Alacritty, Kitty, XFCE4 Terminal, Foot, Ptyxis, or XTerm.
   - Works on KDE Plasma, GNOME, XFCE, Sway, Hyprland, etc.

---

## Supported AI Agents & Systems

| Agent / Model | Environment | Default Role |
| :--- | :--- | :--- |
| **Claude Code** | Terminal CLI | High-level architecture, large refactors, UI/SVG design |
| **OpenAI Codex** | Terminal CLI | Backend algorithms, logic verification, automated tests |
| **Google Gemini CLI** | Terminal CLI | Deep repo audits, large-scale context synthesis, research |
| **Hermes Agent** | Desktop GUI / TUI | Autonomous system execution, background tool orchestration |
| **Devin** | Desktop GUI / CLI | End-to-end task solving, standalone feature implementation |
| **OpenCode AI** | Terminal TUI | Multi-model routing, terminal coding assistant |
| **Qwen Code** | Terminal CLI | High-speed local / remote code execution |
| **Kilo** | Terminal TUI | Rapid prototyping, tool-chaining, desktop apps |
| **Cursor IDE** | Desktop GUI | Visual multi-file code editing, in-editor diff review |
| **OpenClaw** | VM Terminal / Web UI | Sandboxed VM isolation for untrusted scraping & bots |
| **Cline** | Terminal CLI | Autonomous coding agent with auto-approve workflows |
| **Aether** | Terminal CLI | High-velocity uncensored AI coding agent |
| **Browser-Use** | Terminal TUI | Autonomous browser navigation and DOM automation |
| **Ollama** | Local Runner | Local inference and private model routing |

---

## Quickstart

### 1. Clone & Install
```bash
git clone https://github.com/nicholasphillips-systems/agent-desktop.git
cd agent-desktop
chmod +x install.sh
./install.sh
```

### 2. What the Installer Does
1. Scans your system (`PATH`, standard user paths, NVM, Cargo, Flatpak, Snap, `~/Applications`) to detect which agents are installed.
2. Installs custom SVG vector icons to `~/.local/share/icons/ai-agents/` and the system icon theme.
3. Deploys the dynamic context engine (`agent-briefing`) and unified launcher (`launch-ai`) to `~/.local/bin/`.
4. Creates desktop launchers in `~/Desktop/` and `~/.local/share/applications/` so you can launch from your application menu or desktop grid.
5. Scaffolds `~/AGENTS.md` and `~/ACTIVE_CONTEXT.md` for seamless context inheritance.

---

## How It Works

### The Launch Flow
```
[User clicks Desktop Icon]
            │
            ▼
   ~/.local/bin/launch-ai <agent>
            │
            ▼
  [Runs agent-briefing] ──▶ Queries desk list, git commits, master todos
            │           └──▶ Writes ~/ACTIVE_CONTEXT.md
            ▼
   Spawns Terminal Emulator (or opens GUI app)
            │
            ▼
   Displays Linear State Briefing Banner
            │
            ▼
   Starts Agent in ~/ with Pre-Loaded Memory & Rules
```

### Shared Rules File (`~/AGENTS.md`)
Every agent in the workspace is instructed to read `~/AGENTS.md` and `~/ACTIVE_CONTEXT.md` first.
This guarantees that regardless of which AI you invoke:
- It knows your preferred communication style (plain English, one step at a time, concise summaries).
- It never puts AI branding or attribution on your personal projects.
- It checks `desk list` before modifying files so multiple agents never conflict.
- It writes durable findings to your shared second brain instead of trapping them inside private session memories.

---

## Directory Structure
```
agent-desktop/
├── README.md               # Documentation & guide
├── install.sh              # One-command installer
├── bin/
│   ├── detect-agents       # Automated system scanner for AI runtimes
│   ├── agent-briefing      # Live linear context and briefing generator
│   └── launch-ai           # Universal launcher & terminal orchestrator
├── icons/
│   └── svg/                # 15+ Custom vector SVG icons
├── templates/
│   └── AGENTS.md.template  # Universal agent guidelines template
└── docs/                   # Extended architecture documentation
```

---

## Customization

### Adding a New Agent
1. Add an entry to `KNOWN_AGENTS` in `bin/detect-agents`.
2. Add an execution case to `bin/launch-ai`.
3. Drop an SVG icon in `icons/svg/`.
4. Re-run `./install.sh`.

### Modifying Your Working Style
Edit `~/AGENTS.md` to reflect your personal guidelines, tech stacks, or prompt conventions. All agents immediately respect changes on their next launch.

---

## License
MIT License. Built for seamless human-agent collaboration.
