#!/usr/bin/env bash
# install.sh — Setup script for Multi-Agent Desktop Suite
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/.local/bin"
APPS_DIR="$HOME/.local/share/applications"
DESKTOP_DIR="$HOME/Desktop"
ICONS_DIR="$HOME/.local/share/icons/ai-agents"
SCALABLE_DIR="$HOME/.local/share/icons/hicolor/scalable/apps"

echo "========================================================================"
echo "  MULTI-AGENT DESKTOP SUITE INSTALLER"
echo "========================================================================"

mkdir -p "$BIN_DIR" "$APPS_DIR" "$DESKTOP_DIR" "$ICONS_DIR" "$SCALABLE_DIR"

echo "[1/5] Deploying scripts to $BIN_DIR..."
install -m 755 "$REPO_DIR/bin/agent-briefing" "$BIN_DIR/agent-briefing"
install -m 755 "$REPO_DIR/bin/launch-ai" "$BIN_DIR/launch-ai"
install -m 755 "$REPO_DIR/bin/detect-agents" "$BIN_DIR/detect-agents"

echo "[2/5] Deploying vector icons..."
cp "$REPO_DIR/icons/svg/"*.svg "$ICONS_DIR/"
cp "$REPO_DIR/icons/svg/"*.svg "$SCALABLE_DIR/"

echo "[3/5] Scanning for installed AI agents..."
"$BIN_DIR/detect-agents"

echo "[4/5] Generating Desktop and Application shortcuts..."
python3 - <<'PY'
import os
import json
import subprocess
from pathlib import Path

HOME = Path.home()
APPS_DIR = HOME / ".local" / "share" / "applications"
DESKTOP_DIR = HOME / "Desktop"
ICONS_DIR = HOME / ".local" / "share" / "icons" / "ai-agents"

# Run detection
detect_bin = HOME / ".local" / "bin" / "detect-agents"
out = subprocess.check_output([str(detect_bin), "--json"], text=True)
agents = json.loads(out)

for agent_id, data in agents.items():
    if not data["installed"]:
        continue

    filename = f"{agent_id}-agent.desktop"
    if agent_id == "claude": filename = "claude-code.desktop"
    elif agent_id == "codex": filename = "openai-codex.desktop"
    elif agent_id == "gemini": filename = "google-gemini.desktop"
    elif agent_id == "qwen": filename = "qwen-code.desktop"
    elif agent_id == "cursor": filename = "cursor-ide.desktop"
    elif agent_id == "hermes-desktop": filename = "hermes-agent-desktop.desktop"
    elif agent_id == "hermes-cli": filename = "hermes-agent-cli.desktop"

    icon_path = ICONS_DIR / data["icon"]
    exec_cmd = f"/home/{os.environ.get('USER', 'user')}/.local/bin/launch-ai {agent_id}"

    content = f"""[Desktop Entry]
Version=1.0
Type=Application
Name={data['name']}
GenericName=AI Agent
Comment={data['vendor']} {data['name']} with Linear Context
Exec={exec_cmd}
Icon={str(icon_path)}
Terminal=false
Categories=Development;Utility;
StartupNotify=true
Path={str(HOME)}
"""

    app_target = APPS_DIR / filename
    with open(app_target, "w") as f:
        f.write(content)
    os.chmod(app_target, 0o755)

    if DESKTOP_DIR.exists():
        desk_target = DESKTOP_DIR / filename
        with open(desk_target, "w") as f:
            f.write(content)
        os.chmod(desk_target, 0o755)

    print(f"  + Shortcut created: {data['name']} -> {filename}")
PY

echo "[5/5] Initializing live context and updating desktop caches..."
"$BIN_DIR/agent-briefing" --quiet 2>/dev/null || true
update-desktop-database "$APPS_DIR" 2>/dev/null || true
gtk-update-icon-cache -f -t "$HOME/.local/share/icons/hicolor" 2>/dev/null || true

echo "========================================================================"
echo "  INSTALLATION COMPLETE!"
echo "  Your AI agent desktop icons are live in ~/Desktop and Application Menu."
echo "========================================================================"
