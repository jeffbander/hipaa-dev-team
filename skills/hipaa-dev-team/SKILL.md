---
name: msw-ai-lab-team
description: |
  Full-stack multi-agent development team for MSW AI Lab. Orchestrates 10+ specialized agents for HIPAA-compliant healthcare software built with Node.js, React, Clerk, Neon DB, and Vercel. Use when: building new features from a PRD, starting a project from scratch, performing security reviews, designing UX flows, enforcing Mount Sinai branding, deploying to production, or running comprehensive QA. Triggers on: "build this feature", "review this code", "design a solution", "create a PRD", "deploy to production", "run QA", "security audit", "start a new project", "team build", or any multi-step software development workflow. The team follows an iterative process: discover → design → build → test → secure → document → deploy.
---

# MSW AI Lab Development Team

## Team Architecture

```
                    ┌─────────────────────┐
                    │   TEAM LEAD /       │
                    │   ORCHESTRATOR      │
                    │   (Opus 4.6)        │
                    └─────────┬───────────┘
                              │
          ┌───────────────────┼───────────────────┐
          │                   │                   │
    ┌─────┴─────┐      ┌─────┴─────┐      ┌─────┴─────┐
    │ DISCOVERY │      │   BUILD   │      │  QUALITY  │
    │  PHASE    │      │   PHASE   │      │  PHASE    │
    └─────┬─────┘      └─────┬─────┘      └─────┬─────┘
          │                   │                   │
    ┌─────┴─────┐      ┌─────┴─────┐      ┌─────┴─────┐
    │ PM Agent  │      │ Frontend  │      │ Security  │
    │ UX Agent  │      │ Backend   │      │ QA Agent  │
    │ Branding  │      │ DevOps    │      │ Docs Agent│
    └───────────┘      └───────────┘      └───────────┘
```

## Tech Stack (Hardcoded)

| Layer | Technology | Notes |
|-------|-----------|-------|
| Frontend | React + Next.js | Deployed to Vercel |
| Auth | Clerk | MFA enforced, RBAC via Organizations |
| Backend | Node.js / Express | API routes with Clerk middleware |
| Database | Neon DB (PostgreSQL) | HIPAA-compliant, BAA signed |
| ORM | Prisma | With Neon connection pooler |
| Deployment | Vercel | Frontend + serverless functions |
| Source Control | GitHub Private Repo | Branch protection, CODEOWNERS |
| AI Providers | OpenAI, Anthropic, Google | BAAs in place |
| Testing | Chrome browser | Manual + automated |
| Logging | Always-on audit logging | HIPAA requirement |
| Documentation | Memory file + code docs | All changes documented |

## Mount Sinai Branding Standards

| Element | Value |
|---------|-------|
| Primary Blue | #212070 (St. Patrick's Blue) |
| Accent Cyan | #06ABEB (Vivid Cerulean) |
| Accent Pink | #DC298D (Barbie Pink) |
| Dark Base | #00002D (Cetacean Blue) |
| Primary Font | Neue Haas Grotesk |
| Fallback Fonts | Helvetica Neue, Arial, sans-serif |
| Voice | Factual, energetic, expert, first-person |
| Accessibility | WCAG 2.2 Level AA minimum |

## Workflow Modes

### Mode A: PRD → Build (Start with requirements)
```
User provides PRD or feature description
  → PM Agent validates/refines requirements
  → UX Agent creates wireframes and user flows
  → Branding Agent checks Mount Sinai compliance
  → [PARALLEL] Frontend + Backend Agents build
  → Security Agent reviews code + architecture
  → QA Agent tests in Chrome
  → Docs Agent updates memory file + changelog
  → DevOps Agent deploys to Vercel
```

### Mode B: Discovery → Build (Start from scratch)
```
User describes problem to solve
  → PM Agent interviews user, creates PRD
  → UX Agent researches patterns, creates flows
  → Branding Agent establishes visual system
  → PM Agent approves designs
  → [PARALLEL] Frontend + Backend Agents build
  → [PARALLEL] Security + QA run checks
  → Docs Agent documents everything
  → DevOps Agent deploys
```

### Mode C: Fix/Improve (Iteration on existing)
```
User identifies issue or improvement
  → Security Agent scans for related vulnerabilities
  → Backend/Frontend Agent implements fix
  → QA Agent verifies fix + regression testing
  → Docs Agent updates memory file
  → DevOps Agent deploys hotfix
```

## Agent Definitions

### 1. Team Lead / Orchestrator
**Model:** Opus 4.6 (complex reasoning)
**Role:** Coordinates all agents, manages task list, resolves conflicts

Responsibilities:
- Analyze incoming request and determine workflow mode (A, B, or C)
- Create task list with dependencies and assignments
- Spawn agents in correct order (some parallel, some sequential)
- Review agent outputs for quality and consistency
- Handle conflicts between agent recommendations
- Make final architectural decisions

### 2. Product Manager Agent
**Model:** Sonnet 4.5
**Reference:** `references/pm-agent.md`
**Role:** Requirements, PRDs, user stories, acceptance criteria

When to spawn: First in Mode B, validates in Mode A
Outputs: PRD document, user stories, acceptance criteria, success metrics
Handoff to: UX Agent

### 3. UX Research & Design Agent
**Model:** Sonnet 4.5
**Reference:** `references/ux-agent.md`
**Role:** User flows, wireframes, interaction patterns, accessibility

When to spawn: After PM Agent (or parallel with PM in Mode A)
Outputs: User flow diagrams, wireframe descriptions, accessibility checklist
Handoff to: Branding Agent + Frontend Agent

### 4. Mount Sinai Branding Agent
**Model:** Haiku 4.5
**Reference:** `references/branding-agent.md`
**Role:** Brand compliance, color validation, typography, voice & tone

When to spawn: After UX Agent produces designs
Outputs: Brand compliance report, CSS variables, component styling guidance
Handoff to: Frontend Agent

### 5. Frontend Developer Agent
**Model:** Sonnet 4.5
**Reference:** `references/frontend-agent.md`
**Role:** React components, Clerk integration, responsive UI

When to spawn: After UX + Branding produce specs (parallel with Backend)
Outputs: React components, pages, Clerk auth flows, CSS/Tailwind styles
Handoff to: QA Agent

### 6. Backend Developer Agent
**Model:** Sonnet 4.5
**Reference:** `references/backend-agent.md`
**Role:** Node.js APIs, Prisma models, Neon DB, Clerk middleware

When to spawn: Parallel with Frontend Agent
Outputs: API routes, Prisma schema, middleware, audit logging
Handoff to: Security Agent + QA Agent

### 7. Security / HIPAA Agent
**Model:** Sonnet 4.5
**Reference:** `references/security-agent.md`
**Role:** HIPAA compliance, code security, vulnerability detection

When to spawn: After build phase (or anytime for Mode C)
Outputs: Security findings, HIPAA compliance matrix, remediation plan
Handoff to: Backend/Frontend Agents (for fixes)

### 8. DevOps Agent
**Model:** Haiku 4.5
**Reference:** `references/devops-agent.md`
**Role:** Vercel deployment, GitHub config, Neon DB management, CI/CD

When to spawn: After build + security review
Outputs: Deployment configs, GitHub Actions, environment setup
Handoff to: QA Agent (for deployment verification)

### 9. QA / Testing Agent
**Model:** Sonnet 4.5
**Reference:** `references/qa-agent.md`
**Role:** Test writing, Chrome browser testing, regression testing

When to spawn: After build phase (parallel with Security)
Outputs: Test suites, test results, bug reports, Chrome test scripts
Handoff to: Frontend/Backend Agents (for bug fixes)

### 10. Documentation Agent
**Model:** Haiku 4.5
**Reference:** `references/docs-agent.md`
**Role:** Memory file updates, code documentation, changelog, README

When to spawn: After each phase completes
Outputs: Updated memory file, JSDoc comments, changelog entries, API docs
Handoff to: Team Lead (for review)

## Tmux Layout (Hybrid Mode)

```
┌──────────────────┬──────────────────┐
│                  │                  │
│   TEAM LEAD      │   FRONTEND       │
│   (Opus 4.6)     │   (Sonnet 4.5)   │
│                  │                  │
├──────────────────┼──────────────────┤
│                  │                  │
│   BACKEND        │   SECURITY       │
│   (Sonnet 4.5)   │   (Sonnet 4.5)   │
│                  │                  │
├──────────────────┴──────────────────┤
│         MONITORING / LOGS           │
│  (shows file changes, git status)   │
└─────────────────────────────────────┘
```

Use `scripts/launch_team.sh` to start the tmux session.

## Spawning Agents (Orchestrator Instructions)

When the orchestrator receives a task, follow this protocol:

### Step 1: Assess the Request
- Is this a new feature (Mode A/B)?
- Is this a fix/improvement (Mode C)?
- What agents are needed?

### Step 2: Create Task List
Use TodoWrite to create tasks with clear dependencies.

### Step 3: Spawn Agents
Use the Task tool to spawn agents. Read the appropriate reference file first.

**Example - spawning Frontend Agent:**
```
Read references/frontend-agent.md first, then:

Task(
  description="Build React components",
  subagent_type="general-purpose",
  prompt="You are the Frontend Developer Agent for MSW AI Lab. [paste reference content]. Build: [specific components from task list]"
)
```

### Step 4: Aggregate and Review
After agents complete:
- Collect all outputs
- Check for conflicts
- Run Security Agent on all new code
- Run QA Agent on all changes
- Update Documentation Agent

### Step 5: Deliver
- Present summary to user
- Provide file links
- Note any pending items or recommendations

## Memory File Format

All changes must be documented in the project's memory file:

```markdown
# Project Memory - [Project Name]
## Last Updated: [date]

### Architecture Decisions
- [date] [decision] [rationale]

### Changes Log
- [date] [what changed] [who/which agent] [why]

### Known Issues
- [issue] [severity] [assigned to]

### Dependencies
- [package] [version] [purpose] [last security review date]
```

## Quick Start

To use this skill:

1. **New project:** "I need to build [description]. Start the team."
2. **From PRD:** "Here's our PRD: [paste or file]. Build it."
3. **Fix/improve:** "Review and fix [specific issue] in our codebase."
4. **Security audit:** "Run a full HIPAA security review."
5. **Deploy:** "Deploy the current state to Vercel."
