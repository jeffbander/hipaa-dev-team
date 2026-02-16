import React, { useState } from "react";

const agents = [
  {
    name: "Team Lead",
    icon: "🎯",
    model: "Opus 4.6",
    phase: "All Phases",
    color: "#212070",
    description:
      "Orchestrates all agents. Analyzes requests, creates task lists, spawns agents in parallel, resolves conflicts, and delivers final outputs.",
  },
  {
    name: "Product Manager",
    icon: "📋",
    model: "Sonnet 4.5",
    phase: "Discovery",
    color: "#06ABEB",
    description:
      "Creates PRDs, defines user stories, acceptance criteria, and success metrics. Identifies HIPAA implications for every feature.",
  },
  {
    name: "UX Designer",
    icon: "🎨",
    model: "Sonnet 4.5",
    phase: "Discovery",
    color: "#06ABEB",
    description:
      "Designs user flows, wireframes, and interaction patterns. Ensures WCAG 2.2 AA accessibility and mobile-responsive layouts.",
  },
  {
    name: "Branding",
    icon: "🏥",
    model: "Haiku 4.5",
    phase: "Discovery → Build",
    color: "#DC298D",
    description:
      "Enforces Mount Sinai brand compliance. Validates colors (#212070, #06ABEB, #DC298D), typography (Neue Haas Grotesk), and voice guidelines.",
  },
  {
    name: "Frontend Dev",
    icon: "⚛️",
    model: "Sonnet 4.5",
    phase: "Build",
    color: "#212070",
    description:
      "Builds React + Next.js components with Clerk auth integration, Mount Sinai styling, session timeout management, and PHI-safe rendering.",
  },
  {
    name: "Backend Dev",
    icon: "🔧",
    model: "Sonnet 4.5",
    phase: "Build",
    color: "#212070",
    description:
      "Creates Node.js APIs with Prisma ORM, Neon DB integration, AES-256 encryption for PHI, audit logging, and Clerk middleware.",
  },
  {
    name: "Security / HIPAA",
    icon: "🛡️",
    model: "Sonnet 4.5",
    phase: "Quality",
    color: "#FF3B30",
    description:
      "Performs HIPAA compliance audits against 45 CFR 164.312. Runs 6 parallel security scanners. Checks code, infrastructure, and dependencies.",
  },
  {
    name: "DevOps",
    icon: "🚀",
    model: "Haiku 4.5",
    phase: "Deploy",
    color: "#34C759",
    description:
      "Manages Vercel deployments, GitHub Actions CI/CD, Neon DB branching, environment variables, and branch protection rules.",
  },
  {
    name: "QA Tester",
    icon: "🧪",
    model: "Sonnet 4.5",
    phase: "Quality",
    color: "#FF9500",
    description:
      "Writes Jest + RTL tests, performs Chrome browser testing, validates accessibility, and ensures PHI is never exposed in test data.",
  },
  {
    name: "Documentation",
    icon: "📝",
    model: "Haiku 4.5",
    phase: "All Phases",
    color: "#8E8E93",
    description:
      "Maintains the project memory file, writes JSDoc comments, updates CHANGELOG.md, and documents all architectural decisions.",
  },
];

const commands = [
  {
    name: "/build-feature",
    description: "Orchestrate the full team to build from a PRD or description",
  },
  {
    name: "/security-review",
    description: "Run comprehensive HIPAA security audit with 6 parallel scanners",
  },
  {
    name: "/deploy",
    description: "Pre-flight checks + deploy to Vercel production",
  },
  {
    name: "/update-memory",
    description: "Update project memory file with recent changes",
  },
];

export default function AgentsPage() {
  const [selectedAgent, setSelectedAgent] = useState(null);
  const [copied, setCopied] = useState(false);

  const installCommand = "cp -r ~/Downloads/hipaa-dev-team ~/.claude/skills/";

  const handleCopy = () => {
    navigator.clipboard.writeText(installCommand);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  return (
    <div
      style={{
        fontFamily: "'Neue Haas Grotesk', 'Helvetica Neue', Arial, sans-serif",
        backgroundColor: "#00002D",
        color: "#FFFFFF",
        minHeight: "100vh",
      }}
    >
      {/* Hero */}
      <section
        style={{
          padding: "80px 24px",
          textAlign: "center",
          maxWidth: 900,
          margin: "0 auto",
        }}
      >
        <div
          style={{
            display: "inline-block",
            padding: "6px 16px",
            borderRadius: 20,
            backgroundColor: "rgba(6, 171, 235, 0.15)",
            color: "#06ABEB",
            fontSize: 14,
            fontWeight: 600,
            marginBottom: 24,
          }}
        >
          Claude Code Plugin
        </div>
        <h1
          style={{
            fontSize: 48,
            fontWeight: 700,
            lineHeight: 1.15,
            color: "#FFFFFF",
            marginBottom: 20,
          }}
        >
          HIPAA Dev Team
          <br />
          <span style={{ color: "#06ABEB" }}>10 AI Agents. One Team.</span>
        </h1>
        <p
          style={{
            fontSize: 20,
            color: "#B0B0C0",
            maxWidth: 600,
            margin: "0 auto 40px",
            lineHeight: 1.6,
          }}
        >
          10 specialized AI agents that design, build, test, secure, and deploy
          HIPAA-compliant healthcare software — working together as one team.
        </p>

        <div style={{ display: "flex", gap: 16, justifyContent: "center", flexWrap: "wrap" }}>
          <a
            href="https://github.com/jeffbander/hipaa-dev-team/releases/latest/download/hipaa-dev-team.plugin"
            style={{
              padding: "14px 32px",
              backgroundColor: "#212070",
              color: "#FFFFFF",
              borderRadius: 8,
              textDecoration: "none",
              fontWeight: 600,
              fontSize: 16,
            }}
          >
            Download Plugin
          </a>
          <button
            onClick={handleCopy}
            style={{
              padding: "14px 32px",
              backgroundColor: "transparent",
              color: "#06ABEB",
              border: "1px solid #06ABEB",
              borderRadius: 8,
              cursor: "pointer",
              fontWeight: 600,
              fontSize: 16,
            }}
          >
            {copied ? "Copied!" : "Copy Install Command"}
          </button>
        </div>

        <div
          style={{
            marginTop: 20,
            padding: "12px 20px",
            backgroundColor: "rgba(255,255,255,0.05)",
            borderRadius: 8,
            fontFamily: "monospace",
            fontSize: 14,
            color: "#06ABEB",
          }}
        >
          {installCommand}
        </div>
      </section>

      {/* Agent Grid */}
      <section style={{ padding: "40px 24px 80px", maxWidth: 1100, margin: "0 auto" }}>
        <h2
          style={{
            fontSize: 32,
            fontWeight: 700,
            textAlign: "center",
            marginBottom: 48,
            color: "#FFFFFF",
          }}
        >
          Meet the Team
        </h2>

        <div
          style={{
            display: "grid",
            gridTemplateColumns: "repeat(auto-fill, minmax(300px, 1fr))",
            gap: 20,
          }}
        >
          {agents.map((agent, i) => (
            <div
              key={i}
              onClick={() => setSelectedAgent(selectedAgent === i ? null : i)}
              style={{
                padding: 24,
                backgroundColor:
                  selectedAgent === i ? "rgba(255,255,255,0.08)" : "rgba(255,255,255,0.03)",
                borderRadius: 12,
                border: `1px solid ${selectedAgent === i ? agent.color : "rgba(255,255,255,0.08)"}`,
                cursor: "pointer",
                transition: "all 0.2s ease",
              }}
            >
              <div style={{ display: "flex", justifyContent: "space-between", alignItems: "start" }}>
                <div>
                  <span style={{ fontSize: 28, marginRight: 12 }}>{agent.icon}</span>
                  <span style={{ fontSize: 18, fontWeight: 600 }}>{agent.name}</span>
                </div>
                <span
                  style={{
                    fontSize: 11,
                    padding: "4px 10px",
                    borderRadius: 12,
                    backgroundColor: `${agent.color}22`,
                    color: agent.color,
                    fontWeight: 600,
                  }}
                >
                  {agent.phase}
                </span>
              </div>
              <div style={{ marginTop: 8, fontSize: 12, color: "#8E8E93" }}>
                Model: {agent.model}
              </div>
              {selectedAgent === i && (
                <p style={{ marginTop: 12, fontSize: 14, color: "#B0B0C0", lineHeight: 1.6 }}>
                  {agent.description}
                </p>
              )}
            </div>
          ))}
        </div>
      </section>

      {/* Commands */}
      <section
        style={{
          padding: "60px 24px",
          maxWidth: 800,
          margin: "0 auto",
        }}
      >
        <h2
          style={{
            fontSize: 28,
            fontWeight: 700,
            textAlign: "center",
            marginBottom: 32,
          }}
        >
          Slash Commands
        </h2>
        <div style={{ display: "flex", flexDirection: "column", gap: 12 }}>
          {commands.map((cmd, i) => (
            <div
              key={i}
              style={{
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center",
                padding: "16px 20px",
                backgroundColor: "rgba(255,255,255,0.03)",
                borderRadius: 8,
                border: "1px solid rgba(255,255,255,0.08)",
              }}
            >
              <code style={{ color: "#06ABEB", fontWeight: 600, fontSize: 15 }}>
                {cmd.name}
              </code>
              <span style={{ color: "#8E8E93", fontSize: 14 }}>{cmd.description}</span>
            </div>
          ))}
        </div>
      </section>

      {/* Tech Stack */}
      <section style={{ padding: "60px 24px 100px", maxWidth: 800, margin: "0 auto" }}>
        <h2 style={{ fontSize: 28, fontWeight: 700, textAlign: "center", marginBottom: 32 }}>
          Pre-configured Stack
        </h2>
        <div
          style={{
            display: "grid",
            gridTemplateColumns: "repeat(auto-fill, minmax(180px, 1fr))",
            gap: 12,
          }}
        >
          {[
            "React + Next.js",
            "Clerk Auth (MFA)",
            "Node.js APIs",
            "Prisma ORM",
            "Neon DB (HIPAA)",
            "Vercel Deploy",
            "GitHub Actions",
            "Mount Sinai Brand",
          ].map((tech, i) => (
            <div
              key={i}
              style={{
                padding: "14px 16px",
                backgroundColor: "rgba(33, 32, 112, 0.3)",
                borderRadius: 8,
                textAlign: "center",
                fontSize: 14,
                fontWeight: 500,
                color: "#B0B0C0",
              }}
            >
              {tech}
            </div>
          ))}
        </div>
      </section>
    </div>
  );
}
