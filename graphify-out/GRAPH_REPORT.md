# Graph Report - agent-desktop  (2026-10-05)

## Corpus Check
- 6 files · ~5,846 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 1 file(s) not represented in the graph (top: .template 1)

## Summary
- 50 nodes · 56 edges · 9 communities (8 shown, 1 thin omitted)
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `0812e08a`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- agent-briefing
- detect-agents
- ⚡ Agent Desktop Suite
- The Linear Context Model
- launch-ai
- Quickstart
- Customization
- How It Works
- install.sh

## God Nodes (most connected - your core abstractions)
1. `⚡ Agent Desktop Suite` - 10 edges
2. `The Linear Context Model` - 5 edges
3. `Quickstart` - 3 edges
4. `How It Works` - 3 edges
5. `Customization` - 3 edges
6. `Architecture & Design Philosophy` - 2 edges
7. `install.sh script` - 1 edges
8. `A Unified Multi-Agent Cockpit with Linear Context for Linux` - 1 edges
9. `The Problem` - 1 edges
10. `The Solution` - 1 edges

## Surprising Connections (you probably didn't know these)
- None detected - all connections are within the same source files.

## Import Cycles
- None detected.

## Communities (9 total, 1 thin omitted)

### Community 0 - "agent-briefing"
Cohesion: 0.31
Nodes (9): build_markdown_context(), get_active_desks(), get_master_priorities(), get_recent_projects(), main(), print_terminal_banner(), agent-briefing — Generates the live linear context for all AI agents. Maintains…, datetime (+1 more)

### Community 1 - "detect-agents"
Cohesion: 0.24
Nodes (9): detect_all(), locate_binary(), main(), detect-agents — Scans the system for installed AI coding agents, models, and…, json, os, pathlib, shutil (+1 more)

### Community 2 - "⚡ Agent Desktop Suite"
Cohesion: 0.25
Nodes (7): A Unified Multi-Agent Cockpit with Linear Context for Linux, ⚡ Agent Desktop Suite, Directory Structure, License, Supported AI Agents & Systems, The Problem, The Solution

### Community 3 - "The Linear Context Model"
Cohesion: 0.29
Nodes (6): 1. The Pre-Flight Briefing (`agent-briefing`), 2. Multi-Agent Delegation Matrix, 3. File System Safety & Worktree Isolation (`desk`), 4. Durable Memory vs Private Agent Memory, Architecture & Design Philosophy, The Linear Context Model

### Community 4 - "launch-ai"
Cohesion: 0.83
Nodes (3): launch-ai script, detect_terminal(), run_briefing()

### Community 5 - "Quickstart"
Cohesion: 0.67
Nodes (3): 1. Clone & Install, 2. What the Installer Does, Quickstart

### Community 6 - "Customization"
Cohesion: 0.67
Nodes (3): Adding a New Agent, Customization, Modifying Your Working Style

### Community 7 - "How It Works"
Cohesion: 0.67
Nodes (3): How It Works, Shared Rules File (`~/AGENTS.md`), The Launch Flow

## Knowledge Gaps
- **17 isolated node(s):** `install.sh script`, `A Unified Multi-Agent Cockpit with Linear Context for Linux`, `The Problem`, `The Solution`, `Supported AI Agents & Systems` (+12 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 26 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **1 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `⚡ Agent Desktop Suite` connect `⚡ Agent Desktop Suite` to `Quickstart`, `Customization`, `How It Works`?**
  _High betweenness centrality (0.094) - this node is a cross-community bridge._
- **Why does `Quickstart` connect `Quickstart` to `⚡ Agent Desktop Suite`?**
  _High betweenness centrality (0.025) - this node is a cross-community bridge._
- **Why does `How It Works` connect `How It Works` to `⚡ Agent Desktop Suite`?**
  _High betweenness centrality (0.025) - this node is a cross-community bridge._
- **What connects `install.sh script`, `A Unified Multi-Agent Cockpit with Linear Context for Linux`, `The Problem` to the rest of the system?**
  _17 weakly-connected nodes found - possible documentation gaps or missing edges._