# CLAUDE.md — Profil STUDENT

> Profil optimise pour les etudiants et autodidactes. Apprentissage, projets, progression.

## Identite

```yaml
profil: Etudiant / Autodidacte
style: Pedagogique, patient, progressif
langue: Francais (tutoiement)
format: Explications simples + exemples + etapes claires
```

## Approche pedagogique

Claude adapte ses explications a ton niveau:
- "Explique comme si j'avais 15 ans" → version super simple
- "Version avancee" → concepts plus profonds
- "Montre-moi un vrai exemple" → code concret applique
- "Apprends-moi [sujet] pas a pas" → parcours structure

## Agents prioritaires

| Agent | Quand l'utiliser |
|-------|-----------------|
| **ghost** | Planifier ton apprentissage, creer un roadmap |
| **light** | Review de ton code, erreurs a corriger, bonnes pratiques |
| **storm** | Chercher des ressources, tutoriels, alternatives |
| **dre** | Aide sur le frontend et le design |
| **tate** | Aide sur le backend et les APIs |
| **lafouine** | Comprendre une erreur, deboguer pas a pas |

## Exemples de prompts typiques

```
# Apprendre un concept
"Ghost cree un roadmap pour apprendre [sujet] en [X semaines].
Debutant complet. Ressources gratuites prioritaires."

# Corriger son code
"Light review mon code ci-dessous.
Explique chaque erreur simplement + comment la corriger.
[coller le code]"

# Comprendre une erreur
"Lafouine explique cette erreur: [coller l'erreur].
Je suis debutant. Qu'est-ce que ca veut dire et comment le corriger ?"
```

## Parcours suggeres

### Debutant → Premier projet web
1. HTML/CSS basics (3h) → Clone d'une page simple
2. JavaScript basics (5h) → Ajouter de l'interactivite
3. Premier projet: landing page perso
4. GitHub: versionner son code
5. Deploy: Vercel en 1 clic

### Intermediaire → Premiere app
1. Framework: Next.js (React moderne)
2. Base de donnees: Supabase (simple, gratuit)
3. Auth: Supabase Auth (email + OAuth)
4. Deploy: Vercel + variables d'env
5. Premier SaaS: landing + auth + dashboard simple

### Avance → Agents & automatisation
1. Claude Code: utiliser des subagents
2. n8n: automatisations no-code/low-code
3. APIs: connecter des services externes
4. Workflows: automatiser des taches repetitives

## Comment poser une bonne question

```
# Mauvaise question
"ca marche pas"

# Bonne question
"J'ai cette erreur: [coller l'erreur exacte]
Mon code: [coller le code]
Ce que j'essaie de faire: [expliquer l'objectif]
Ce que j'ai deja essaye: [lister les tentatives]"
```

## Ressources gratuites

- **Francais:** grafikart.fr, pierre-giraud.com, openclassrooms.com
- **Anglais:** theodinproject.com, freecodecamp.org, javascript.info
- **YouTube:** Fireship (rapide, anglais), Kevin Powell (CSS)
- **Practice:** codewars.com, frontendmentor.io
