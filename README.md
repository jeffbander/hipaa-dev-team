# HIPAA Dev Team Plugin

A comprehensive multi-agent development and security team for building HIPAA-compliant healthcare software at the MSW AI Lab (Mount Sinai Health System).

## What It Does

This plugin provides a full team of 10 specialized AI agents that work together to design, build, test, secure, and deploy healthcare software. Every agent is configured for your exact tech stack and enforces HIPAA compliance at every step.

## Commands

| Command | Description |
|---------|-------------|
| `/build-feature` | Orchestrate the full team to build a feature from PRD or description |
| `/security-review` | Run comprehensive HIPAA security audit with 6 parallel scanners |
| `/deploy` | Pre-flight checks + deploy to Vercel |
| `/update-memory` | Update the project memory file with recent changes |

## Agents

| Agent | Triggers On | Focus |
|-------|-------------|-------|
| `team-lead` | "build this", "start project", PRD handoff | Coordinates all agents |
| `security-reviewer` | "security review", "HIPAA check", "audit" | Security + HIPAA compliance |

## Skills

### HIPAA Security Review
6 parallel sub-agents analyzing code security, infrastructure, dependencies, auth, HIPAA compliance, and AI-code patterns.

### HIPAA Dev Team
10 specialized agents: PM, UX, Branding, Frontend, Backend, Security, DevOps, QA, Documentation, Team Lead.

## Tech Stack (Pre-configured)

- **Frontend:** React + Next.js → Vercel
- **Auth:** Clerk (MFA enforced, RBAC via Organizations)
- **Backend:** Node.js API routes + Clerk middleware
- **Database:** Neon DB (PostgreSQL) + Prisma ORM
- **AI Providers:** OpenAI, Anthropic, Google (BAAs in place)
- **Branding:** Mount Sinai Health System guidelines

## Installation

### Option 1: Plugin File
Download `hipaa-dev-team.plugin` and open it — Claude will prompt you to install.

### Option 2: Manual
```bash
cp -r hipaa-dev-team ~/.claude/skills/
```

### Option 3: From mswlab.ai
Visit https://mswlab.ai/agents and click "Install Plugin"

## Tmux Multi-Pane Launcher

```bash
chmod +x skills/hipaa-dev-team/scripts/launch_team.sh
./skills/hipaa-dev-team/scripts/launch_team.sh /path/to/project full
```

Modes: `full` (4 panes), `build` (3 panes), `review` (2 panes), `solo` (1 pane)

## Mount Sinai Brand Colors

| Color | Hex | Usage |
|-------|-----|-------|
| St. Patrick's Blue | `#212070` | Primary |
| Vivid Cerulean | `#06ABEB` | Accents |
| Barbie Pink | `#DC298D` | CTAs/Alerts |
| Cetacean Blue | `#00002D` | Dark base |
