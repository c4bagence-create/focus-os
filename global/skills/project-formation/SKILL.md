---
name: project-formation
description: Chemin complet pour creer une formation multi-page de A a Z. Des objectifs pedagogiques a la publication. Anti-zigzag — chaque etape est obligatoire, dans l'ordre.
trigger: /project formation
---

# PROJECT TYPE: Formation

> Tu veux creer une formation ? Voici le chemin COMPLET.
> Pas de zigzag — chaque etape produit un livrable, chaque gate valide avant de passer a la suite.
> Duree estimee: 2-4 heures par module (Quick Flow) / 1-3 jours (Full, multi-page)

---

## Vue d'ensemble

```
ETAPE 1: Objectifs pedagogiques  → Ce que l'apprenant saura faire
  ↓ GATE 1: Objectifs mesurables
ETAPE 2: Structure modules       → Plan de la formation
  ↓ GATE 2: Structure coherente
ETAPE 3: Contenu expert          → Recherche et redaction
  ↓ GATE 3: Contenu verifie
ETAPE 4: Composants visuels      → Elements interactifs et visuels
  ↓ GATE 4: Composants integres
ETAPE 5: Navigation              → Index + liens + parcours
  ↓ GATE 5: Navigation fluide
ETAPE 6: Tests                   → QA, mobile, liens, contenu
  ↓ GATE 6: Tests OK
ETAPE 7: Publication             → Mise en ligne
```

**Resultat final:** Formation multi-page deployee, navigable, avec composants interactifs et contenu expert.

---

## ETAPE 1 — Objectifs pedagogiques

**Pourquoi cette etape:** Si tu ne sais pas ce que l'apprenant doit SAVOIR FAIRE a la fin, tu vas ecrire du contenu dans tous les sens. Les objectifs c'est le GPS de la formation — chaque module, chaque exercice existe pour atteindre un objectif precis.

**Agent:** ghost (strategie pedagogique)
**Skills a charger:** `vision360` (recherche exhaustive sur le sujet)
**Duree:** 15-20 min

### Ce qu'on fait
1. **Definir le public:** Debutant, intermediaire, expert ? Quel background ?
2. **Objectif global:** En 1 phrase — "A la fin, l'apprenant sera capable de..."
3. **Objectifs par module** (formulation Bloom):
   - Niveau 1 (Memoriser): "Identifier les 3 types de..."
   - Niveau 2 (Comprendre): "Expliquer pourquoi..."
   - Niveau 3 (Appliquer): "Utiliser [outil] pour..."
   - Niveau 4 (Analyser): "Comparer les avantages de..."
   - Niveau 5 (Evaluer): "Juger si [approche] est adaptee pour..."
   - Niveau 6 (Creer): "Concevoir un [livrable] complet"
4. **Pre-requis:** Ce qu'il faut savoir AVANT de commencer
5. **Ton et style:** Dark / technique / vulgarise — selon la cible

### Livrable
`{projet}/_focus-output/formation/objectifs.md`

### GATE 1 — Objectifs mesurables
- [ ] Chaque objectif commence par un verbe d'action (pas "comprendre" tout seul)
- [ ] Chaque objectif est verifiable (on peut tester si l'apprenant l'a atteint)
- [ ] Public cible defini avec precision
- [ ] Pre-requis explicites
- [ ] Objectifs valides

---

## ETAPE 2 — Structure modules

**Pourquoi cette etape:** Une formation c'est comme une serie — chaque episode (module) fait progresser l'histoire. Si les modules sont dans le desordre ou mal decoupes, l'apprenant decroche. La structure definit le PARCOURS d'apprentissage.

**Agent:** ghost (structure)
**Duree:** 20-30 min

### Ce qu'on fait
1. **Plan de formation:**
   - Index (page d'accueil avec tous les modules)
   - Module 1: [Titre] — bases, fondamentaux
   - Module 2: [Titre] — approfondissement
   - Module N: [Titre] — maitrise
   - Arsenal (page bonus avec outils/ressources) — optionnel
2. **Pour chaque module:**
   - Titre accrocheur (pas "Module 3" mais "Le hack qui change tout")
   - Objectifs specifiques (lies aux objectifs de l'etape 1)
   - Sections (3-7 par module)
   - Composants visuels prevus (terminal, device mockup, etc.)
   - Exercice ou generateur interactif
   - Duree estimee de lecture (5-15 min par page)
3. **Progression logique:**
   - Du simple au complexe
   - Chaque module s'appuie sur le precedent
   - Pas de concept utilise sans avoir ete explique avant
4. **Badges de difficulte:** Debutant / Intermediaire / Avance par module

### Livrable
`{projet}/_focus-output/formation/structure.md`

### GATE 2 — Structure coherente
- [ ] Chaque objectif de l'etape 1 est couvert par au moins un module
- [ ] Progression logique (pas de saut de difficulte)
- [ ] Chaque module a 3-7 sections
- [ ] Duree totale realiste pour le public cible
- [ ] Structure validee

---

## ETAPE 3 — Contenu expert

**Pourquoi cette etape:** Le contenu c'est le COEUR de la formation. Si c'est superficiel ou imprecis, l'apprenant s'en rend compte et perd confiance. On fait une recherche approfondie, on verifie les sources, et on redige comme un expert qui vulgarise — pas comme Wikipedia.

**Agent:** ghost (redaction Opus), storm (recherche)
**Skills a charger:** `vision360` (deep search), skill domaine specifique si pertinent
**Duree:** 1-3h selon le nombre de modules

### Ce qu'on fait
1. **Recherche par module:**
   - Sources primaires (documentation officielle, papers, experts reconnus)
   - Sources secondaires (articles, tutos, communautes)
   - Donnees a jour (pas d'infos perimees)
   - Verification croisee (minimum 2 sources pour chaque affirmation)
2. **Redaction:**
   - Direct, dense, zero bullshit
   - Chaque concept = explication simple + exemple concret
   - Code: explique ligne par ligne, pas de copie aveugle
   - Commandes: syntaxe exacte, contexte d'utilisation, resultat attendu
   - Liens cliquables vers outils et ressources
3. **Generateurs interactifs:**
   - Scripts/outils cliquables que l'apprenant peut utiliser directement
   - Formulaires avec generation de commandes/configs
   - Calculateurs si pertinent

### Livrable
Fichiers HTML des modules (ex: `module-01-bases.html`, `module-02-avance.html`)

### GATE 3 — Contenu verifie
- [ ] Chaque affirmation a une source verifiable
- [ ] Code et commandes testes et fonctionnels
- [ ] Liens cliquables et qui marchent
- [ ] Generateurs interactifs fonctionnels
- [ ] **Opus ecrit le contenu** — Sonnet est trop superficiel pour les methodologies

---

## ETAPE 4 — Composants visuels

**Pourquoi cette etape:** Le cerveau retient 65% d'une information quand elle est associee a un visuel, contre 10% en texte seul. Les composants visuels transforment du contenu technique en experience memorable. Chaque concept abstrait merite un visuel concret.

**Agent:** dre (frontend, integration)
**Duree:** 30 min - 1h

### Ce qu'on fait
1. **Identifier les composants** pour chaque module:
   - Terminal simule (commandes CLI en action)
   - Device mockup (interface sur vrai telephone/laptop)
   - Diagramme step-by-step (processus complexes → etapes visuelles)
   - Tableau comparatif (option A vs B)
   - Risk/Threat meter (niveaux de risque visuels)
   - Timeline interactive (historique, evolution)
   - Code block avec copie (commandes pretes a l'emploi)
   - Cartes interactives (pays, concepts, outils)
   - Badges de difficulte
   - Progress indicators
2. **Integrer dans le HTML** avec le design system defini
3. **Animations subtiles:** Scroll reveals, hover states, transitions
4. **Regle:** JAMAIS 3 paragraphes sans element visuel

### Livrable
Composants integres dans les fichiers HTML des modules

### GATE 4 — Composants integres
- [ ] Au moins 3 composants visuels differents par module
- [ ] Style coherent avec le design system
- [ ] Animations fluides (pas de saccade)
- [ ] Composants responsive (mobile OK)
- [ ] Zero texte dense sans visuel de coupure

---

## ETAPE 5 — Navigation

**Pourquoi cette etape:** Une formation ou tu te perds, tu la quittes. La navigation c'est le fil rouge — l'apprenant doit TOUJOURS savoir ou il est, d'ou il vient, et ou il va. C'est aussi ce qui donne envie de continuer (progression visible).

**Agent:** dre (frontend)
**Duree:** 15-20 min

### Ce qu'on fait
1. **Page index:**
   - Vue d'ensemble de tous les modules
   - Badges de difficulte visibles
   - Description courte de chaque module
   - Progression si applicable (modules completes)
2. **Navigation inter-pages:**
   - Boutons Precedent / Suivant en bas de chaque module
   - Breadcrumb ou indicateur de position
   - Lien retour vers l'index sur chaque page
3. **Navigation intra-page:**
   - Table des matieres cliquable (sticky ou en haut)
   - Smooth scroll vers les sections
   - Bouton "retour en haut"
4. **Cohesion:** Meme header/footer sur toutes les pages

### Livrable
Navigation integree dans tous les fichiers HTML + page index

### GATE 5 — Navigation fluide
- [ ] Index avec tous les modules listes
- [ ] Navigation Precedent/Suivant sur chaque page
- [ ] Retour index accessible partout
- [ ] Smooth scroll fonctionnel
- [ ] Aucun lien casse entre les pages

---

## ETAPE 6 — Tests

**Pourquoi cette etape:** Un lien casse, un texte qui deborde sur mobile, un generateur qui bugge — ca ruine l'experience. Les tests verifient que TOUT fonctionne avant de publier. C'est la difference entre "formation amateur" et "formation pro".

**Agent:** light (QA)
**Duree:** 15-20 min

### Ce qu'on fait
1. **Liens:** Chaque lien interne et externe clique et fonctionne
2. **Mobile:** Toutes les pages sur 375px (iPhone SE), 768px (tablette), 1280px (desktop)
3. **Composants:** Chaque generateur/outil interactif teste avec des inputs reels
4. **Contenu:** Relecture orthographe, dates coherentes, pas de placeholder oublie
5. **Performance:** Chargement < 3s sur chaque page
6. **Navigation:** Parcours complet index → module 1 → module 2 → ... → fin
7. **Code blocks:** Commandes copiables et correctes

### Livrable
`{projet}/_focus-output/formation/test-report.md`

### GATE 6 — Tests OK
- [ ] Zero lien casse
- [ ] Mobile responsive sur toutes les pages
- [ ] Generateurs fonctionnels
- [ ] Zero faute d'orthographe
- [ ] Performance OK (< 3s)
- [ ] Parcours navigation complet teste

---

## ETAPE 7 — Publication

**Pourquoi cette etape:** La formation doit etre accessible. Que ce soit en local, sur un serveur, ou sur Vercel — la mise en ligne est la derniere etape avant que les apprenants puissent l'utiliser.

**Agent:** dre (deploy) ou tate (infra)
**Duree:** 10-15 min

### Ce qu'on fait
1. **Choix hebergement:** Vercel (rapide) / Hostinger (existant) / local (test)
2. **Deploy:** Push des fichiers
3. **Verification en prod:**
   - URL fonctionnelle
   - HTTPS actif
   - Toutes les pages chargent
   - Images et fonts chargent (pas de 404)
4. **Securite (si besoin):**
   - Mot de passe si formation payante/privee
   - Auth gate

### Livrable
URL live de la formation

### Gate finale — Formation publiee
- [ ] Toutes les pages accessibles en ligne
- [ ] Navigation complete fonctionnelle
- [ ] Composants interactifs OK en prod
- [ ] Auth/MDP si necessaire
- [ ] Parcours complet valide

---

## Quick Flow (version rapide)

Pour une formation courte (1-3 pages) en 2-3h.

```
QUICK-OBJECTIFS (5 min) → QUICK-STRUCTURE (10 min) → QUICK-CONTENU (1-2h) → QUICK-DEPLOY (10 min)
```

### Quick-Objectifs
- 3-5 objectifs max
- Public et pre-requis en 2 lignes

### Quick-Structure
- 1-3 pages max
- Sections listees pour chaque page
- Pas de page index si < 3 pages

### Quick-Contenu
- ghost ecrit directement (Opus obligatoire)
- Composants visuels integres en meme temps que le contenu
- Navigation simple (liens entre pages)

### Quick-Deploy
- Push Vercel ou test local (`python3 -m http.server 3850`)
- Verification rapide mobile + desktop

---

## Mapping Agents

| Etape | Agent principal | Agents support | Pourquoi cet agent |
|-------|----------------|----------------|---------------------|
| 1 Objectifs | ghost | — | ghost = vision strategique pedagogique |
| 2 Structure | ghost | — | ghost = structure et progression |
| 3 Contenu | ghost (Opus!) | storm | ghost Opus = qualite contenu, storm = recherche |
| 4 Composants | dre | — | dre = frontend, integration des composants |
| 5 Navigation | dre | — | dre = integration liens + index |
| 6 Tests | light | — | light = QA systematique |
| 7 Publication | dre/tate | — | dre = Vercel, tate = infra custom |

### Regle critique
**Opus ecrit le contenu, TOUJOURS.** Sonnet est trop superficiel pour les methodologies, les explications detaillees, et le contenu expert. Sonnet peut coder les composants et la navigation, mais le FOND c'est Opus.

---

## Dossier de sortie

```
{projet}/
├── index.html
├── module-01-[nom].html
├── module-02-[nom].html
├── ...
├── arsenal.html (optionnel — outils/ressources bonus)
├── shared/
│   ├── style.css
│   └── nav.js
└── _focus-output/
    └── formation/
        ├── objectifs.md
        ├── structure.md
        └── test-report.md
```
