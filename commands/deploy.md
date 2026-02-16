---
description: Deploy current state to Vercel with pre-flight checks
allowed-tools: Read, Grep, Glob, Bash(git:*, npm:*, npx:*, vercel:*)
model: haiku
---

Run pre-deployment checks and deploy to Vercel.

Pre-flight checklist:
1. Run `npm run lint` — fix any errors
2. Run `npm run type-check` — fix any type errors
3. Run `npm test` — ensure all tests pass
4. Run `npm audit --audit-level=moderate` — check for vulnerabilities
5. Check for hardcoded secrets: grep for API keys, passwords, tokens
6. Verify environment variables are set (not hardcoded)
7. Check git status — ensure working tree is clean

If all checks pass:
- Commit any pending changes with descriptive message
- Push to the appropriate branch
- Run `vercel --prod` for production or `vercel` for preview

If any check fails:
- Report the specific failure
- Suggest fixes
- Do NOT deploy until issues are resolved

After deployment:
- Verify deployment URL is accessible
- Check for console errors
- Report deployment status and URL
