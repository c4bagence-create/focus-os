# Focus Kit — Roadmap

## v2.1 — CLI Premium (prochain sprint)
- [ ] Integrer Gum (charmbracelet) pour remplacer les `read` basiques par des prompts stylises
- [ ] Spinners animes pendant les installations
- [ ] File picker pour selection de profil
- [ ] Progress bar visuelle par phase
- Dependance: `brew install gum`

## v2.2 — Environment Reproducible
- [ ] devbox.json pour pinning dependances (Node 20, Claude Code, Git)
- [ ] direnv auto-activation par projet
- [ ] .nvmrc distribue dans le kit
- [ ] Chezmoi integration pour dotfiles multi-machine

## v2.3 — Parallel Work
- [ ] Documentation Conductor.build pour sessions Claude paralleles
- [ ] Git worktrees setup automatise
- [ ] Templates de workflow multi-branch

## v2.4 — CI/CD Integration
- [ ] GitHub Actions setup pour @claude dans les PR
- [ ] Auto-review sur PR push
- [ ] Auto-labeling des issues
- [ ] Release notes automatiques

## v2.5 — Advanced Automation
- [ ] Custom MCP servers templates
- [ ] Async hooks avances (PostEdit -> tests auto)
- [ ] /loop monitoring templates
- [ ] Health check dashboard

## v3.0 — Multi-platform
- [ ] Support Linux (apt au lieu de brew)
- [ ] Support Windows (WSL)
- [ ] Docker image pre-configuree

## Inspiration
- gstack (Garry Tan) — role-based skills, "completeness is cheap"
- Charmbracelet/Gum — beautiful CLI
- Cursor .mdc — composable rules with metadata
- Learn Prompting — interactive playground
- 30-60-90 onboarding — progression structuree
