#!/bin/bash
# HIPAA Dev Team - One-Line Installer
# Usage: curl -sL https://mswlab.ai/install.sh | bash
#    or: bash install.sh

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}  HIPAA Dev Team Installer${NC}"
echo -e "${BLUE}  MSW AI Lab • Mount Sinai${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

SKILLS_DIR="$HOME/.claude/skills"
PLUGIN_NAME="hipaa-dev-team"

# Create skills directory if needed
mkdir -p "$SKILLS_DIR"

# Check if already installed
if [ -d "$SKILLS_DIR/$PLUGIN_NAME" ]; then
  echo -e "${CYAN}Updating existing installation...${NC}"
  rm -rf "$SKILLS_DIR/$PLUGIN_NAME"
fi

# Determine source
if [ -f "$PLUGIN_NAME.plugin" ]; then
  echo -e "${GREEN}Found .plugin file, extracting...${NC}"
  unzip -qo "$PLUGIN_NAME.plugin" -d "$SKILLS_DIR/$PLUGIN_NAME"
elif [ -d "$PLUGIN_NAME" ]; then
  echo -e "${GREEN}Found plugin directory, copying...${NC}"
  cp -r "$PLUGIN_NAME" "$SKILLS_DIR/$PLUGIN_NAME"
elif [ -d "skills" ] && [ -f ".claude-plugin/plugin.json" ]; then
  echo -e "${GREEN}Inside plugin directory, copying...${NC}"
  CURRENT_DIR=$(pwd)
  cp -r "$CURRENT_DIR" "$SKILLS_DIR/$PLUGIN_NAME"
elif command -v git &> /dev/null; then
  echo -e "${GREEN}Cloning from GitHub...${NC}"
  git clone https://github.com/mswailab/hipaa-dev-team.git "$SKILLS_DIR/$PLUGIN_NAME"
  rm -rf "$SKILLS_DIR/$PLUGIN_NAME/.git"
else
  echo -e "${RED}Error: Could not find plugin source.${NC}"
  echo "Download from: https://mswlab.ai/agents"
  exit 1
fi

# Make scripts executable
find "$SKILLS_DIR/$PLUGIN_NAME" -name "*.sh" -exec chmod +x {} \;

echo ""
echo -e "${GREEN}✓ HIPAA Dev Team installed successfully!${NC}"
echo ""
echo -e "  Location: ${CYAN}$SKILLS_DIR/$PLUGIN_NAME${NC}"
echo ""
echo -e "  Commands available:"
echo -e "    ${CYAN}/build-feature${NC}    Build a feature with the full team"
echo -e "    ${CYAN}/security-review${NC}  Run HIPAA security audit"
echo -e "    ${CYAN}/deploy${NC}           Pre-flight + deploy to Vercel"
echo -e "    ${CYAN}/update-memory${NC}    Update project memory file"
echo ""
echo -e "${BLUE}Start a new Claude Code session to use the plugin.${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
