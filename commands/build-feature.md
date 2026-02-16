---
description: Build a feature with the full MSW AI Lab agent team
allowed-tools: Read, Write, Edit, Grep, Glob, Bash, Task
model: opus
argument-hint: [feature-description-or-PRD-path]
---

Activate the MSW AI Lab development team to build a feature. Read the skill at `${CLAUDE_PLUGIN_ROOT}/skills/hipaa-dev-team/SKILL.md` for the full team protocol.

Feature request: $ARGUMENTS

Follow this workflow:

1. **Assess the request** — Is this a PRD (Mode A), a problem to discover (Mode B), or a fix (Mode C)?

2. **Discovery Phase** (if needed):
   - Spawn PM Agent to create/validate PRD
   - Spawn UX Agent to design user flows
   - Spawn Branding Agent to check Mount Sinai compliance

3. **Build Phase** (parallel):
   - Spawn Frontend Agent (React + Clerk + Mount Sinai styles)
   - Spawn Backend Agent (Node.js + Prisma + Neon DB)

4. **Quality Phase** (parallel):
   - Spawn Security Agent for HIPAA review
   - Spawn QA Agent for testing

5. **Finalize**:
   - Spawn Documentation Agent to update memory file and changelog
   - Present summary with all files created/modified

Use the agent reference files in `${CLAUDE_PLUGIN_ROOT}/skills/hipaa-dev-team/references/` for each specialized agent's instructions.

Tech stack: React + Next.js, Clerk auth, Node.js backend, Prisma ORM, Neon DB, Vercel deployment, Mount Sinai branding.
