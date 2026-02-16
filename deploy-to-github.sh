#!/bin/bash
# Deploy HIPAA Dev Team to GitHub
# Run this from the hipaa-dev-team-repo directory
# Requires: gh CLI (brew install gh) and authenticated (gh auth login)

set -e

REPO_NAME="hipaa-dev-team"
ORG="mswailab"  # Change to your GitHub org/username

echo "🚀 Creating GitHub repo: $ORG/$REPO_NAME"

# Create the repo (private by default)
gh repo create "$ORG/$REPO_NAME" \
  --private \
  --description "HIPAA Dev Team - Multi-agent development team for HIPAA-compliant healthcare software" \
  --source . \
  --remote origin \
  --push

echo ""
echo "✅ Repository created and pushed!"
echo "   https://github.com/$ORG/$REPO_NAME"
echo ""

# Create a release with the .plugin file
if [ -f "../hipaa-dev-team.plugin" ]; then
  echo "📦 Creating release v1.0.0..."
  gh release create v1.0.0 \
    --repo "$ORG/$REPO_NAME" \
    --title "HIPAA Dev Team v1.0.0" \
    --notes "Initial release of the HIPAA Dev Team plugin for Claude Code.

## What's Included
- 10 specialized AI agents (PM, UX, Branding, Frontend, Backend, Security, DevOps, QA, Docs, Team Lead)
- 4 slash commands (/build-feature, /security-review, /deploy, /update-memory)
- HIPAA security review with 6 parallel scanners
- Mount Sinai Health System branding enforcement
- Pre-configured for React, Node.js, Clerk, Neon DB, Vercel
- Tmux multi-pane launcher

## Installation
\`\`\`bash
curl -sL https://mswlab.ai/install.sh | bash
\`\`\`
Or download the .plugin file below." \
    "../hipaa-dev-team.plugin" \
    "docs/HIPAA-Dev-Team-README.docx"

  echo "✅ Release created with downloadable assets!"
fi

echo ""
echo "📋 Next steps:"
echo "   1. Visit https://github.com/$ORG/$REPO_NAME/settings"
echo "   2. Add the install.sh to your mswlab.ai website"
echo "   3. Link the release download on the /agents page"
