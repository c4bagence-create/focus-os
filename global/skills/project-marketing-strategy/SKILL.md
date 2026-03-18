---
name: project-marketing-strategy
description: Chemin complet pour creer une strategie marketing de A a Z. Du brainstorm initial au plan d'action budgete avec KPIs. Anti-zigzag — chaque etape est obligatoire, dans l'ordre.
trigger: /project marketing strategy
---

# PROJECT TYPE: Strategie Marketing

> Tu veux une strategie marketing ? Voici le chemin COMPLET.
> Pas de zigzag — chaque etape produit un livrable, chaque gate valide avant de passer a la suite.
> Duree estimee: 2-4 heures (Quick Flow) / 1-2 jours (Full)

---

## Vue d'ensemble

```
ETAPE 1: Brainstorm         → Liste de techniques pertinentes
  ↓ GATE 1: Techniques shortlistees
ETAPE 2: Audit marche        → Etat des lieux complet
  ↓ GATE 2: Donnees verifiees
ETAPE 3: Positionnement      → Place unique sur le marche
  ↓ GATE 3: Positionnement valide
ETAPE 4: Plan d'action       → Actions concretes planifiees
  ↓ GATE 4: Plan actionnable
ETAPE 5: Budgets             → Chiffrage realiste
  ↓ GATE 5: Budget approuve
ETAPE 6: Presentation        → Document client/interne
  ↓ GATE 6: Presentation validee
ETAPE 7: KPIs tracking       → Tableau de suivi
```

**Resultat final:** Plan marketing complet + presentation + tableau de KPIs pret a executer.

---

## ETAPE 1 — Brainstorm (62 techniques)

**Pourquoi cette etape:** On ne peut pas choisir une strategie sans connaitre TOUTES les options. La plupart des gens foncent sur "faire des pubs Facebook" sans savoir qu'il existe 62 techniques marketing differentes. Cette etape ouvre le champ des possibles.

**Agent:** ghost (strategie) + storm (recherche)
**Skills a charger:** `vision360` (pour la recherche exhaustive)
**Duree:** 30-45 min

### Ce qu'on fait
1. **storm** fait une recherche exhaustive des techniques marketing adaptees au type de business (SaaS, e-commerce, service, etc.)
2. **ghost** organise par categorie:
   - Acquisition (SEO, ads, affiliation, cold outreach, events, PR, partnerships...)
   - Retention (email, communaute, programme fidelite, upsell, content...)
   - Viralite (referral, user-generated content, gamification...)
   - Branding (positioning, storytelling, thought leadership...)
3. Pour chaque technique: pertinence (1-5), difficulte, cout estime, delai avant resultats
4. Shortlister les 5-10 techniques les plus pertinentes

### Livrable
`{projet}/_focus-output/marketing/brainstorm-techniques.md`

### GATE 1 — Techniques shortlistees
- [ ] Au moins 30 techniques evaluees (sur les 62 possibles)
- [ ] Shortlist de 5-10 techniques avec justification
- [ ] Chaque technique a un score pertinence + cout + delai
- [ ] Shortlist validee

---

## ETAPE 2 — Audit marche (Vision360)

**Pourquoi cette etape:** Sans donnees, une strategie n'est que de l'intuition. L'audit montre ou en est le marche, ce que font les concurrents, et ou sont les opportunites que personne n'exploite.

**Agent:** storm (recherche principale)
**Skills a charger:** `vision360` (protocole de recherche)
**Duree:** 45 min - 1h

### Ce qu'on fait
1. **Marche:** Taille, tendances, croissance, acteurs principaux
2. **Concurrence:** Top 5-10 concurrents, ce qu'ils font bien, ce qu'ils font mal, leurs canaux marketing
3. **Audience:** Qui achete, pourquoi, ou ils trainent en ligne, quels sont leurs problemes non resolus
4. **Opportunites:** Les trous dans le marche — ce que personne ne fait ou fait mal
5. **Risques:** Ce qui peut mal tourner (reglementation, saturation, saison, etc.)

### Livrable
`{projet}/_focus-output/marketing/audit-marche.md`

### GATE 2 — Donnees verifiees
- [ ] Sources citees et verifiables (pas de "on dit que...")
- [ ] Au moins 5 concurrents analyses avec forces/faiblesses
- [ ] Audience definie avec precision (pas "tout le monde")
- [ ] Au moins 3 opportunites identifiees
- [ ] Risques listes avec probabilite/impact
- [ ] Audit valide

---

## ETAPE 3 — Positionnement

**Pourquoi cette etape:** Si tu ne choisis pas ta place sur le marche, le marche la choisit pour toi (et c'est jamais la bonne). Le positionnement c'est ta promesse unique — pourquoi les gens viennent chez toi plutot qu'ailleurs.

**Agent:** ghost (strategie), tasha (formulation)
**Skills a charger:** `copywriting` (pour la formulation)
**Duree:** 30 min

### Ce qu'on fait
1. **Statement de positionnement:** Pour [cible], [marque] est le [categorie] qui [benefice unique] parce que [raison credible]
2. **Valeur unique (USP):** Ce qu'on fait que PERSONNE d'autre ne fait
3. **Territoire de marque:** Ce qu'on revendique, ce qu'on laisse aux autres
4. **Ton et personnalite:** Comment on parle (pas juste ce qu'on dit)
5. **Message cle:** La phrase que les gens retiennent (max 10 mots)

### Livrable
`{projet}/_focus-output/marketing/positionnement.md`

### GATE 3 — Positionnement valide
- [ ] Statement tient en 2 phrases
- [ ] USP est unique (verifier que les concurrents ne disent pas la meme chose)
- [ ] Message cle est memorable et precis
- [ ] Coherent avec l'univers de la marque
- [ ] Positionnement valide

---

## ETAPE 4 — Plan d'action

**Pourquoi cette etape:** Les idees sans planning finissent a la poubelle. Le plan transforme les techniques choisies en actions concretes avec des dates, des responsables, et un ordre logique.

**Agent:** ghost (coordination), tasha (contenu), storm (recherche tactique)
**Skills a charger:** `focus-process` (methode de planning)
**Duree:** 30-45 min

### Ce qu'on fait
1. **Pour chaque technique retenue:**
   - Actions concretes (quoi faire, pas "ameliorer le SEO" mais "creer 10 articles cibles sur [mots-cles]")
   - Responsable (agent ou humain)
   - Timeline (quand ca commence, quand c'est fini)
   - Dependances (cette action AVANT celle-la)
   - Resources necessaires (outils, budget, temps)
2. **Planning trimestre 1:** Focus sur les quick wins (resultats < 30 jours)
3. **Planning trimestres 2-4:** Actions moyen-long terme
4. **Milestones:** Points de controle pour verifier que ca avance

### Livrable
`{projet}/_focus-output/marketing/plan-action.md`

### GATE 4 — Plan actionnable
- [ ] Chaque action est SMART (Specifique, Mesurable, Atteignable, Realiste, Temporel)
- [ ] Ordre chronologique logique (pas de dependance cassee)
- [ ] Quick wins identifies pour les 30 premiers jours
- [ ] Responsables assignes
- [ ] Plan valide

---

## ETAPE 5 — Budgets

**Pourquoi cette etape:** Sans budget, c'est du reve. Chaque action a un cout — il faut savoir COMBIEN ca coute et quel retour on attend. Ca evite de claquer du budget sur un canal qui ne marchera pas.

**Agent:** ghost (arbitrage), storm (benchmark prix)
**Skills a charger:** `vision360` (pour les benchmarks reels)
**Duree:** 20-30 min

### Ce qu'on fait
1. **Budget par action:**
   - Cout direct (ads, outils, freelances, etc.)
   - Cout indirect (temps passe)
   - ROI attendu (realiste, pas fantaisiste)
2. **Budget total par trimestre**
3. **Scenarios:**
   - Minimum viable (avec quoi on demarre si budget serre)
   - Optimal (ce qu'il faudrait idealement)
   - Full send (si on veut aller vite et fort)
4. **Seuils de rentabilite:** A partir de quand chaque canal devient rentable

### Livrable
`{projet}/_focus-output/marketing/budgets.md`

### GATE 5 — Budget approuve
- [ ] Chaque poste de depense est chiffre
- [ ] ROI attendu base sur des benchmarks reels (pas invente)
- [ ] 3 scenarios presentes (min/optimal/full)
- [ ] Budget total par trimestre
- [ ] Un scenario approuve

---

## ETAPE 6 — Presentation

**Pourquoi cette etape:** Un plan marketing dans un fichier markdown, personne ne le lit. La presentation transforme tout le travail en document visuel, clair, qui donne envie de passer a l'action.

**Agent:** ghost (structure), dre (design), tasha (copy), tommy (DA)
**Skills a charger:** `copywriting` (formulation impactante)
**Duree:** 30-45 min

### Ce qu'on fait
1. Structure en slides:
   - Slide 1: Mission + positionnement (1 phrase)
   - Slide 2-3: Audit marche (chiffres cles, concurrence)
   - Slide 4: Opportunites identifiees
   - Slide 5-7: Plan d'action (timeline visuelle)
   - Slide 8: Budget + scenarios
   - Slide 9: KPIs cibles
   - Slide 10: Next steps
2. Design premium (style marque)
3. HTML interactif ou PDF selon le besoin

### Livrable
`{projet}/_focus-output/marketing/presentation.html` (ou .pdf)

### GATE 6 — Presentation validee
- [ ] Max 15 slides
- [ ] Chaque slide a UN message clair
- [ ] Visuels et graphiques (pas de murs de texte)
- [ ] Design coherent avec la marque
- [ ] Presentation validee

---

## ETAPE 7 — KPIs tracking

**Pourquoi cette etape:** Sans mesure, tu ne sais pas si ta strategie marche. Les KPIs c'est ton tableau de bord — chaque mois tu regardes les chiffres et tu sais si tu es sur la bonne route ou si tu dois corriger.

**Agent:** ghost (choix des metriques), storm (outils analytics)
**Skills a charger:** `vision360` (benchmarks sectoriels)
**Duree:** 15-20 min

### Ce qu'on fait
1. **KPIs par canal:**
   - SEO: trafic organique, positions mots-cles, DA
   - Ads: CPA, ROAS, CTR, conversion rate
   - Email: open rate, click rate, unsub rate
   - Social: engagement rate, reach, followers growth
   - Ventes: revenue, panier moyen, LTV, churn
2. **Dashboard de suivi:** Template de tableau avec frequence de mesure
3. **Seuils d'alerte:** En dessous de X = action corrective
4. **Revue mensuelle:** Agenda type pour analyser les KPIs

### Livrable
`{projet}/_focus-output/marketing/kpis-dashboard.md`

### Gate finale — Strategie complete
- [ ] Toutes les etapes 1-7 produites
- [ ] Tous les gates passes
- [ ] Presentation validee
- [ ] KPIs definis avec seuils
- [ ] Plan pret a executer

---

## Quick Flow (version rapide)

Pour quand tu as besoin d'une strategie en 1h, pas en 2 jours.

```
QUICK-BRAINSTORM (15 min) → QUICK-POSITIONNEMENT (10 min) → QUICK-PLAN (20 min) → QUICK-KPIS (10 min)
```

### Quick-Brainstorm
- storm recherche les 5 techniques les plus pertinentes pour le business
- ghost les classe par impact/effort
- Output: 3-5 techniques retenues

### Quick-Positionnement
- ghost formule le statement en 2 phrases
- tasha propose le message cle
- Output: USP + message

### Quick-Plan
- ghost cree un plan 30-60-90 jours
- 3-5 actions concretes par mois
- Output: plan trimestriel simple

### Quick-KPIs
- ghost choisit les 5 KPIs les plus importants
- Output: tableau de suivi basique

---

## Mapping Agents

| Etape | Agent principal | Agents support | Pourquoi cet agent |
|-------|----------------|----------------|---------------------|
| 1 Brainstorm | ghost | storm | ghost = strategie, storm = recherche exhaustive |
| 2 Audit | storm | — | storm = recherche et angles morts |
| 3 Positionnement | ghost | tasha | ghost = decision, tasha = formulation |
| 4 Plan | ghost | tasha, storm | ghost = coordination, tasha = contenu, storm = tactique |
| 5 Budgets | ghost | storm | ghost = arbitrage, storm = benchmarks reels |
| 6 Presentation | dre | ghost, tasha, tommy | dre = design, ghost = structure, tasha = copy, tommy = DA |
| 7 KPIs | ghost | storm | ghost = metriques cles, storm = outils analytics |

---

## Dossier de sortie

```
{projet}/
└── _focus-output/
    └── marketing/
        ├── brainstorm-techniques.md
        ├── audit-marche.md
        ├── positionnement.md
        ├── plan-action.md
        ├── budgets.md
        ├── presentation.html
        └── kpis-dashboard.md
```
