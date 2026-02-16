#!/bin/bash
# ============================================================
# MSW AI Lab - Multi-Agent Team Launcher
# ============================================================
# Launches a team of Claude Code agents in tmux panes
# with a hybrid parallel/sequential workflow.
#
# Usage:
#   ./launch_team.sh [project_dir] [mode]
#
# Modes:
#   full    - All 4 panes (lead + frontend + backend + security)
#   build   - 3 panes (lead + frontend + backend)
#   review  - 2 panes (lead + security)
#   solo    - 1 pane (lead only, spawns subagents internally)
#
# Requirements:
#   - tmux installed
#   - claude (Claude Code CLI) installed
#   - Project directory with .claude/CLAUDE.md
# ============================================================

set -e

PROJECT_DIR="${1:-.}"
MODE="${2:-full}"
SESSION_NAME="msw-team"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${CYAN}╔════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║   MSW AI Lab - Agent Team Launcher     ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "Project:  ${GREEN}$PROJECT_DIR${NC}"
echo -e "Mode:     ${GREEN}$MODE${NC}"
echo -e "Session:  ${GREEN}$SESSION_NAME${NC}"
echo ""

# Verify dependencies
command -v tmux >/dev/null 2>&1 || { echo -e "${RED}Error: tmux not installed${NC}"; exit 1; }
command -v claude >/dev/null 2>&1 || { echo -e "${RED}Error: claude CLI not installed${NC}"; exit 1; }

# Navigate to project
cd "$PROJECT_DIR" || { echo -e "${RED}Error: Cannot access $PROJECT_DIR${NC}"; exit 1; }

# Kill existing session if any
tmux kill-session -t "$SESSION_NAME" 2>/dev/null || true

case "$MODE" in
  full)
    echo -e "${YELLOW}Launching full team (4 panes)...${NC}"
    echo "  Pane 0: Team Lead (Opus 4.6)"
    echo "  Pane 1: Frontend Agent (Sonnet 4.5)"
    echo "  Pane 2: Backend Agent (Sonnet 4.5)"
    echo "  Pane 3: Security Agent (Sonnet 4.5)"
    echo ""

    # Create session with first pane
    tmux new-session -d -s "$SESSION_NAME" -x 240 -y 60

    # Pane 0: Team Lead
    tmux send-keys -t "${SESSION_NAME}:0.0" "claude" C-m

    # Split right for Frontend
    tmux split-window -h -t "${SESSION_NAME}:0.0"
    sleep 0.3
    tmux send-keys -t "${SESSION_NAME}:0.1" "claude" C-m

    # Split Pane 0 vertically for Backend
    tmux split-window -v -t "${SESSION_NAME}:0.0"
    sleep 0.3
    tmux send-keys -t "${SESSION_NAME}:0.2" "claude" C-m

    # Split Pane 1 vertically for Security
    tmux split-window -v -t "${SESSION_NAME}:0.1"
    sleep 0.3
    tmux send-keys -t "${SESSION_NAME}:0.3" "claude" C-m

    # Label panes (visible in status)
    tmux select-pane -t "${SESSION_NAME}:0.0" -T "LEAD"
    tmux select-pane -t "${SESSION_NAME}:0.1" -T "FRONTEND"
    tmux select-pane -t "${SESSION_NAME}:0.2" -T "BACKEND"
    tmux select-pane -t "${SESSION_NAME}:0.3" -T "SECURITY"
    ;;

  build)
    echo -e "${YELLOW}Launching build team (3 panes)...${NC}"

    tmux new-session -d -s "$SESSION_NAME" -x 240 -y 60
    tmux send-keys -t "${SESSION_NAME}:0.0" "claude" C-m

    tmux split-window -h -t "${SESSION_NAME}:0.0"
    sleep 0.3
    tmux send-keys -t "${SESSION_NAME}:0.1" "claude" C-m

    tmux split-window -v -t "${SESSION_NAME}:0.0"
    sleep 0.3
    tmux send-keys -t "${SESSION_NAME}:0.2" "claude" C-m

    tmux select-pane -t "${SESSION_NAME}:0.0" -T "LEAD"
    tmux select-pane -t "${SESSION_NAME}:0.1" -T "FRONTEND"
    tmux select-pane -t "${SESSION_NAME}:0.2" -T "BACKEND"
    ;;

  review)
    echo -e "${YELLOW}Launching review team (2 panes)...${NC}"

    tmux new-session -d -s "$SESSION_NAME" -x 240 -y 60
    tmux send-keys -t "${SESSION_NAME}:0.0" "claude" C-m

    tmux split-window -h -t "${SESSION_NAME}:0.0"
    sleep 0.3
    tmux send-keys -t "${SESSION_NAME}:0.1" "claude" C-m

    tmux select-pane -t "${SESSION_NAME}:0.0" -T "LEAD"
    tmux select-pane -t "${SESSION_NAME}:0.1" -T "SECURITY"
    ;;

  solo)
    echo -e "${YELLOW}Launching solo mode (1 pane, subagents)...${NC}"

    tmux new-session -d -s "$SESSION_NAME" -x 240 -y 60
    tmux send-keys -t "${SESSION_NAME}:0.0" "claude" C-m
    ;;

  *)
    echo -e "${RED}Unknown mode: $MODE${NC}"
    echo "Valid modes: full, build, review, solo"
    exit 1
    ;;
esac

# Enable pane titles
tmux set -t "$SESSION_NAME" pane-border-status top
tmux set -t "$SESSION_NAME" pane-border-format "#{pane_title}"

echo ""
echo -e "${GREEN}Team launched successfully!${NC}"
echo ""
echo "Attach with:  tmux attach -t $SESSION_NAME"
echo "Detach:       Ctrl+B, then D"
echo "Switch pane:  Ctrl+B, then arrow key"
echo "Kill session: tmux kill-session -t $SESSION_NAME"
echo ""

# Attach
tmux attach-session -t "$SESSION_NAME"
