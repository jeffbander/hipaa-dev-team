# HIPAA Dev Team

**A multi-agent development team for building HIPAA-compliant healthcare software.**

10 specialized AI agents that design, build, test, secure, and deploy healthcare applications — working together as one team inside [Claude Code](https://claude.ai/claude-code).

Built by the MSW AI Lab at Mount Sinai Health System.

---

## Download & Install

### Option 1: Plugin File (Recommended)

1. Go to the [Latest Release](https://github.com/jeffbander/hipaa-dev-team/releases/latest)
2. Download **`hipaa-dev-team.plugin`**
3. Open the downloaded file — Claude Code will detect it and prompt you to install automatically
4. Click "Install" when prompted
5. Start a **new Claude Code session** to activate the plugin

That's it. The 4 slash commands and 10 agents are now available.

### Option 2: Clone from GitHub

```bash
# 1. Clone the repository
git clone https://github.com/jeffbander/hipaa-dev-team.git

# 2. Copy to your Claude skills directory
mkdir -p ~/.claude/skills
cp -r hipaa-dev-team ~/.claude/skills/hipaa-dev-team

# 3. Start a new Claude Code session
```

### Option 3: One-Line Install Script

```bash
curl -sL https://raw.githubusercontent.com/jeffbander/hipaa-dev-team/master/install.sh | bash
```

### Verify Installation

After installing, start a new Claude Code session and type any of these to confirm it's working:

```
/build-feature
/security-review
/deploy
/update-memory
```

If the commands are recognized, you're all set.

### Updating

To update to the latest version, just repeat any of the install methods above. The installer will replace the existing files automatically.

### Uninstall

```bash
rm -rf ~/.claude/skills/hipaa-dev-team
```

---

## What's Inside

### 10 Specialized Agents

| # | Agent | Model | Phase | What It Does |
|---|-------|-------|-------|-------------|
| 1 | **Team Lead** | Opus 4.6 | All | Orchestrates agents, manages tasks, resolves conflicts, makes architecture decisions |
| 2 | **Product Manager** | Sonnet 4.5 | Discovery | PRDs, user stories, acceptance criteria, HIPAA implications |
| 3 | **UX Designer** | Sonnet 4.5 | Discovery | User flows, wireframes, WCAG 2.2 AA accessibility |
| 4 | **Branding** | Haiku 4.5 | Discovery | Mount Sinai brand compliance (colors, typography, voice) |
| 5 | **Frontend Dev** | Sonnet 4.5 | Build | React + Next.js, Clerk auth, Mount Sinai styling |
| 6 | **Backend Dev** | Sonnet 4.5 | Build | Node.js APIs, Prisma ORM, Neon DB, AES-256 encryption |
| 7 | **Security** | Sonnet 4.5 | Quality | HIPAA audits (45 CFR 164.312), vulnerability scanning |
| 8 | **DevOps** | Haiku 4.5 | Deploy | Vercel deployment, GitHub Actions CI/CD |
| 9 | **QA Tester** | Sonnet 4.5 | Quality | Jest tests, Chrome testing, PHI leak detection |
| 10 | **Documentation** | Haiku 4.5 | All | Memory file, JSDoc, CHANGELOG, architecture decisions |

### 4 Slash Commands

| Command | What It Does |
|---------|-------------|
| `/build-feature` | Full team builds a feature from a PRD or natural language description |
| `/security-review` | HIPAA security audit with 6 parallel scanners |
| `/deploy` | Pre-flight checks (lint, tests, npm audit, secret scan) then Vercel deploy |
| `/update-memory` | Update project memory file with recent git changes and decisions |

### HIPAA Security Scanner

The `/security-review` command spawns 6 parallel sub-agents:

- **Code Security** — SQL injection, XSS, command injection, path traversal (with CWE IDs)
- **Infrastructure** — Docker, Kubernetes, cloud config, Terraform misconfigurations
- **Dependencies** — CVEs, outdated packages, license compliance, SBOM generation
- **Auth & Access** — Clerk MFA, RBAC, session management, password policies
- **HIPAA Compliance** — All 5 technical safeguards under 45 CFR 164.312
- **AI-Code Patterns** — 11 vulnerability patterns common in AI-generated code

Each scanner produces a findings report with severity levels (CRITICAL / HIGH / MEDIUM / LOW) and copy-paste fix templates.

---

## Workflow Modes

### Mode A: PRD → Build
Start with a PRD or feature description. The team validates requirements, designs UX, enforces branding, builds frontend and backend in parallel, runs security and QA, documents everything, and deploys.

### Mode B: Discovery → Build
Describe a problem. The PM Agent interviews you to create a PRD, UX researches patterns, Branding establishes the visual system, then the build and quality phases proceed.

### Mode C: Fix & Improve
Point to an issue or improvement. Security scans for related vulnerabilities, the appropriate dev agent implements the fix, QA verifies, Documentation updates the memory file, and DevOps deploys the hotfix.

---

## Pre-configured Tech Stack

Every agent knows your exact stack — no setup or configuration needed.

| Layer | Technology | Details |
|-------|-----------|---------|
| Frontend | React + Next.js | App Router, deployed to Vercel |
| Auth | Clerk | MFA enforced, RBAC via Organizations, BAA signed |
| Backend | Node.js | API routes with Clerk middleware |
| Database | Neon DB (PostgreSQL) | HIPAA-compliant, BAA signed, Prisma ORM |
| Deployment | Vercel | Frontend + serverless functions, BAA available |
| Source Control | GitHub Private Repo | Branch protection, CODEOWNERS, Dependabot |
| AI Providers | OpenAI, Anthropic, Google | BAAs in place with all three providers |
| Branding | Mount Sinai Health System | Official colors, typography, accessibility standards |

---

## Mount Sinai Brand Standards

All outputs conform to Mount Sinai Health System brand guidelines.

| Element | Value | Usage |
|---------|-------|-------|
| Primary Blue | `#212070` | Headers, navigation, primary buttons |
| Vivid Cerulean | `#06ABEB` | Links, accents, active states |
| Barbie Pink | `#DC298D` | CTAs, alerts, innovation highlights |
| Cetacean Blue | `#00002D` | Body text, dark backgrounds |
| Font | Neue Haas Grotesk | All UI text (fallbacks: Helvetica Neue, Arial) |
| Accessibility | WCAG 2.2 Level AA | 4.5:1 contrast, keyboard nav, screen readers |

---

## HIPAA Compliance Coverage

Audits against all 5 HIPAA Security Rule technical safeguards, including 2026 mandatory requirements.

| Safeguard | 2026 Status | What We Check |
|-----------|------------|---------------|
| Access Controls (164.312(a)) | All Required | Unique user IDs, emergency access, auto-logoff, encryption |
| Audit Controls (164.312(b)) | Required | PHI access logging, 6+ year retention, log integrity |
| Integrity Controls (164.312(c)) | Required | Data integrity, ePHI source authentication |
| Authentication (164.312(d)) | MFA Required | Multi-factor auth, password policy, sessions |
| Transmission Security (164.312(e)) | Required | TLS 1.2+, encrypted DB connections, no PHI in URLs |

---

## Tmux Multi-Pane Workflow

Watch agents work in parallel using the included tmux launcher:

```bash
chmod +x ~/.claude/skills/hipaa-dev-team/skills/hipaa-dev-team/scripts/launch_team.sh
~/.claude/skills/hipaa-dev-team/skills/hipaa-dev-team/scripts/launch_team.sh /path/to/project full
```

| Mode | Panes | Agents |
|------|-------|--------|
| `full` | 4 | Team Lead + Frontend + Backend + Security |
| `build` | 3 | Team Lead + Frontend + Backend |
| `review` | 2 | Team Lead + Security |
| `solo` | 1 | Team Lead (spawns sub-agents internally) |

---

## File Structure

```
hipaa-dev-team/
├── .claude-plugin/
│   └── plugin.json            # Plugin manifest
├── agents/
│   ├── team-lead.md            # Team Lead agent
│   └── security-reviewer.md    # Security agent
├── commands/
│   ├── build-feature.md        # /build-feature
│   ├── security-review.md      # /security-review
│   ├── deploy.md               # /deploy
│   └── update-memory.md        # /update-memory
├── skills/
│   ├── hipaa-dev-team/         # Full 10-agent team
│   │   ├── SKILL.md
│   │   ├── references/         # 9 agent knowledge bases
│   │   └── scripts/
│   │       └── launch_team.sh  # Tmux launcher
│   └── hipaa-security-review/  # HIPAA security scanner
│       ├── SKILL.md
│       └── references/         # 7 security knowledge bases
├── docs/
│   └── HIPAA-Dev-Team-README.docx
├── agents-page.jsx             # Website landing page component
├── install.sh                  # One-line installer
├── LICENSE
└── README.md
```

---

## Requirements

- [Claude Code](https://claude.ai/claude-code) — Anthropic's CLI coding tool
- A Claude Pro, Team, or Enterprise subscription

For the full dev workflow, you'll also need:
- GitHub account (source control)
- Clerk account (authentication)
- Neon DB account (database)
- Vercel account (deployment)

---

## Documentation

Full documentation is available as a Word document in the `docs/` folder, or as a download on the [Releases page](https://github.com/jeffbander/hipaa-dev-team/releases/latest).

---

## License

MIT — see [LICENSE](LICENSE).

Built by the **MSW AI Lab** at **Mount Sinai Health System** — [mswlab.ai](https://mswlab.ai)
