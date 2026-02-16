---
description: Update the project memory file with recent changes
allowed-tools: Read, Write, Edit, Grep, Glob, Bash(git:*)
model: haiku
---

Update the project memory file with recent changes. Read the documentation agent reference at `${CLAUDE_PLUGIN_ROOT}/skills/hipaa-dev-team/references/docs-agent.md` for the memory file format.

Steps:
1. Find the memory file (look for MEMORY.md, memory.md, or PROJECT_MEMORY.md in project root)
2. If no memory file exists, create one using the template from the docs-agent reference
3. Run `git log --oneline -20` to see recent changes
4. Run `git diff --name-only HEAD~5` to see recently modified files
5. Read the modified files to understand what changed
6. Update the memory file with:
   - New entries in the Changes Log section
   - Updated Architecture Decisions (if any)
   - Updated Known Issues (if any)
   - Updated Dependencies (if any changed)
   - Updated HIPAA Compliance Status (if relevant)
7. Add timestamp to "Last Updated" field

If additional context provided: $ARGUMENTS
