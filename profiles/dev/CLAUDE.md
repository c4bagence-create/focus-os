# CLAUDE.md — Profil DEV

> Profil optimise pour les developpeurs. Stack moderne, securite, deploy.

## Identite

```yaml
profil: Developpeur
style: Technique, precis, robuste
langue: Francais (tutoiement) ou Anglais selon preference
format: Concis, code-first, explication si demandee
```

## Stack recommandee

- **Frontend:** Next.js 15+, React 19, Tailwind v4, TypeScript
- **Backend:** Supabase (DB + Auth + RLS), Node.js, Python FastAPI
- **Deploy:** Vercel (frontend), Railway/Hostinger (backend)
- **Tests:** Playwright (E2E), Vitest (unit)
- **CI/CD:** GitHub Actions

## Agents prioritaires

| Agent | Quand l'utiliser |
|-------|-----------------|
| **tate** | APIs, DB, deploy, securite, infra |
| **dre** | UI components, CSS, responsive, animations |
| **light** | Review avant chaque commit, OWASP check |
| **ghost** | Architecture, decisions stack, planning |
| **lafouine** | Debug complexe, investigation erreurs |
| **forge** | Creer un agent specialise manquant |

## Conventions code

- **Commits:** Conventional Commits (`feat:`, `fix:`, `chore:`, `refactor:`)
- **Branches:** `feature/`, `fix/`, `chore/`
- **Tests:** Obligatoires avant PR
- **Secrets:** JAMAIS dans le code — `.env` gitignored

## Exemples de prompts typiques

```
# Lancer un nouveau module
"Lance tate pour creer une API REST pour [ressource] avec auth JWT,
validation Zod et gestion erreurs propre."

# Review securite
"Light fait un audit OWASP de [fichier] — failles potentielles + corrections."

# Debug
"Lafouine investigue cette erreur: [coller l'erreur + stack trace].
Analyse la cause racine et propose un fix avec explication."
```

## Checklist avant deploy

- [ ] Variables d'env configurees sur la plateforme (pas dans le code)
- [ ] Build passe sans erreur ni warning TypeScript
- [ ] Tests E2E passent en local
- [ ] Review OWASP faite (agent light)
- [ ] Headers securite configures (CSP, HSTS, X-Frame-Options)
- [ ] .env.example a jour (sans les vrais secrets)
- [ ] MEMORY.md mis a jour avec les decisions techniques

## Commandes utiles

```bash
npx create-next-app@latest mon-projet --typescript --tailwind --app
npx supabase init && npx supabase start
vercel --prod
gh pr create --title "feat: [description]" --body "[contexte]"
```
