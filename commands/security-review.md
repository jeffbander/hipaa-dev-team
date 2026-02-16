---
description: Run a full HIPAA security review of the codebase
allowed-tools: Read, Grep, Glob, Bash(npm:*), Task
model: sonnet
argument-hint: [path-or-focus-area]
---

Perform a comprehensive HIPAA security review of this codebase. Read the skill at `${CLAUDE_PLUGIN_ROOT}/skills/hipaa-security-review/SKILL.md` for the full review protocol.

Focus area (if specified): $ARGUMENTS

Spawn 6 parallel subagents using the Task tool to analyze:
1. Code Security (SAST patterns, injection flaws, XSS)
2. Infrastructure Security (Vercel config, Neon DB, GitHub)
3. Dependency Vulnerabilities (npm audit, CVEs, outdated packages)
4. Authentication & Access Control (Clerk MFA, RBAC, sessions)
5. HIPAA Technical Safeguards (45 CFR 164.312 compliance)
6. AI-Generated Code Patterns (common AI coding vulnerabilities)

After all agents complete, aggregate findings into a single report with:
- Executive summary with severity counts
- HIPAA compliance matrix
- 2026 readiness score
- Prioritized remediation roadmap
- Code fix examples for each finding

Save the report to `security-report-[date].md` in the project root.
