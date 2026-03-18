---
name: project-branding
description: Chemin complet pour creer une identite de marque de A a Z. Du brainstorm aux declinaisons. Anti-zigzag — chaque etape est obligatoire, dans l'ordre.
trigger: /project branding
---

# PROJECT TYPE: Branding

> Tu veux une identite de marque ? Voici le chemin COMPLET.
> Pas de zigzag — chaque etape produit un livrable, chaque gate valide avant de passer a la suite.
> Duree estimee: 1-2 heures (Quick Flow) / 2-4 jours (Full)

---

## Vue d'ensemble

```
ETAPE 1: Brainstorm identite    → Qui est la marque ?
  ↓ GATE 1: Identite definie
ETAPE 2: Moodboard              → Direction visuelle
  ↓ GATE 2: Direction validee
ETAPE 3: Palette + Typo         → Couleurs et typographie
  ↓ GATE 3: Systeme visuel valide
ETAPE 4: Logo concepts          → Propositions de logo
  ↓ GATE 4: Logo choisi
ETAPE 5: Guidelines             → Regles d'utilisation
  ↓ GATE 5: Charte complete
ETAPE 6: Declinaisons           → Application sur tous les supports
```

**Resultat final:** Charte graphique complete avec logo, couleurs, typographie, regles d'utilisation et declinaisons sur tous les supports (social, print, web).

---

## ETAPE 1 — Brainstorm identite

**Pourquoi cette etape:** Une marque sans identite claire ressemble a toutes les autres. Le brainstorm force a repondre aux questions fondamentales: qui on est, ce qu'on represente, et comment on veut etre percu. C'est le ADN de la marque — tout le reste en decoule.

**Agent:** tommy (branding), ghost (strategie)
**Skills a charger:** `vision360` (recherche inspiration)
**Duree:** 20-30 min

### Ce qu'on fait
1. **ADN de marque:**
   - Mission: Pourquoi cette marque existe (en 1 phrase)
   - Vision: Ou elle veut aller dans 3-5 ans
   - Valeurs: Les 3-5 principes non-negociables
   - Personnalite: Si la marque etait une personne, qui serait-elle ?
2. **Territoire de marque:**
   - Univers emotionnel: Quelles emotions on veut declencher ?
   - References culturelles: Films, musiques, epoques, mouvements qui inspirent
   - Ce qu'on est vs ce qu'on n'est PAS (important pour se differencier)
3. **Analyse concurrence visuelle:**
   - Comment se presentent les 5-10 concurrents
   - Les codes visuels du secteur (ce qui est attendu)
   - Les opportunites (ce que personne ne fait visuellement)
4. **Mots-cles visuels:** 10-15 mots qui decrivent l'ambiance visuelle cible
   - Ex: "sombre, premium, urbain, confidentiel, technologique"
   - Ex: "lumineux, naturel, artisanal, chaleureux, minimal"

### Livrable
`{projet}/_focus-output/branding/identite.md`

### GATE 1 — Identite definie
- [ ] Mission en 1 phrase
- [ ] 3-5 valeurs definies
- [ ] Personnalite de marque decrite
- [ ] Mots-cles visuels listes
- [ ] Concurrence visuelle analysee
- [ ] ADN valide

---

## ETAPE 2 — Moodboard

**Pourquoi cette etape:** Les mots ne suffisent pas pour definir un style visuel. Le moodboard traduit les mots-cles en IMAGES — c'est le pont entre l'idee et le design. Ca evite les "c'est pas ce que j'avais en tete" apres 3 semaines de travail.

**Agent:** tommy (branding), storm (recherche references)
**Skills a charger:** `vision360` (recherche exhaustive)
**Duree:** 20-30 min

### Ce qu'on fait
1. **Collecte de references:**
   - 15-25 images qui representent l'univers vise
   - Sources: Dribbble, Behance, Pinterest, sites concurrents/inspirants
   - Mix: photos, typo, logos, packaging, UI, textures, ambiances
2. **Categorisation:**
   - Couleurs dominantes
   - Style typographique
   - Type d'images (photographie, illustration, 3D, abstrait)
   - Mood/ambiance (energique, calme, premium, rebelle, etc.)
3. **Moodboard compose:**
   - Planche visuelle organisee (grid ou collage)
   - Annotations: pourquoi chaque reference est pertinente
4. **Anti-references:**
   - 5-10 visuels qui representent ce qu'on ne veut PAS
   - Tout aussi important que les references positives

### Livrable
`{projet}/_focus-output/branding/moodboard.html` (ou image composite)

### GATE 2 — Direction validee
- [ ] 15-25 references pertinentes
- [ ] Anti-references definies
- [ ] Direction visuelle claire et coherente
- [ ] Moodboard valide (c'est le point le plus crucial — si le moodboard est valide, le reste coule)

---

## ETAPE 3 — Palette + Typo

**Pourquoi cette etape:** Les couleurs et la typographie representent 80% de la reconnaissance d'une marque. Coca-Cola c'est rouge + Spencerian script. Apple c'est blanc/gris + San Francisco. Ta palette et ta typo, c'est ta signature visuelle — les gens te reconnaissent avant meme de lire ton nom.

**Agent:** tommy (branding), dre (implementation technique)
**Duree:** 20-30 min

### Ce qu'on fait
1. **Palette de couleurs:**
   - Couleur primaire: la couleur SIGNATURE de la marque
   - Couleur secondaire: complement ou accent
   - Couleurs neutres: backgrounds, texte, borders
   - Couleur d'alerte/CTA: pour les actions importantes
   - Format: Hex + OKLCH (pour Tailwind v4)
   - Ratio de contraste: WCAG AA minimum (4.5:1 pour le texte)
   - Test: daltonisme (simulateur pour s'assurer que ca reste lisible)
2. **Typographie:**
   - Font titres: personnalite forte, recognizable
   - Font body: lisible, neutre, confortable sur de longs textes
   - Font mono (optionnel): pour le code ou les chiffres
   - Echelle typographique: tailles h1→h6 + body + small
   - Line height: 1.5 pour le body, 1.1-1.2 pour les titres
   - Source: Google Fonts (gratuit) ou Variable Fonts (performance)
3. **Tests de combinaison:**
   - Palette appliquee sur un mockup (carte, bouton, page)
   - Typo testee sur differentes tailles et fonds
   - Verification dark mode si applicable

### Livrable
`{projet}/_focus-output/branding/palette-typo.md` + tokens CSS/Tailwind

### GATE 3 — Systeme visuel valide
- [ ] Palette complete (primaire + secondaire + neutres + CTA)
- [ ] Contraste WCAG AA verifie
- [ ] 2-3 fonts choisies et testees
- [ ] Echelle typographique definie
- [ ] Mockup de test valide
- [ ] Couleurs et typos validees

---

## ETAPE 4 — Logo concepts

**Pourquoi cette etape:** Le logo c'est le visage de la marque. C'est ce que les gens voient en premier et ce qu'ils retiennent. Mais un logo seul ne suffit pas — il doit fonctionner partout: sur un ecran, une carte de visite, un favicon, un t-shirt. C'est pourquoi on fait plusieurs concepts avant de choisir.

**Agent:** tommy (creation), ghost (validation strategie)
**Duree:** 30 min - 1h

### Ce qu'on fait
1. **Exploration (3-5 concepts):**
   - Logotype pur (texte seul style)
   - Logomark (icone/symbole)
   - Combinaison (icone + texte)
   - Variations: chaque concept explore 2-3 sous-directions
2. **Criteres de qualite:**
   - Reconnaissable en 3 secondes
   - Fonctionne en noir et blanc
   - Fonctionne en petit (favicon 32x32)
   - Fonctionne en grand (affiche)
   - Simple (pas plus de 3 elements visuels)
   - Original (pas de ressemblance avec un logo existant)
3. **Presentation des concepts:**
   - Chaque concept montre sur fond clair ET fond sombre
   - Mockup realiste (sur un site, une carte, un packaging)
   - Justification du choix creatif (lien avec l'ADN de marque)

### Livrable
`{projet}/_focus-output/branding/logo-concepts/` (dossier avec les propositions)

### GATE 4 — Logo choisi
- [ ] 3-5 concepts presentes
- [ ] Chaque concept teste noir/blanc, petit/grand, clair/sombre
- [ ] Mockups realistes fournis
- [ ] UN concept choisi
- [ ] Variantes du concept retenu (horizontal, vertical, icone seule)

---

## ETAPE 5 — Guidelines

**Pourquoi cette etape:** Sans guidelines, chaque personne qui touche a la marque fait sa propre interpretation. Les guidelines c'est le mode d'emploi visuel — elles garantissent que la marque a la meme gueule que ce soit sur Instagram, un flyer, ou un email. C'est ce qui fait la difference entre une marque pro et une marque amateur.

**Agent:** tommy (creation), dre (mise en forme)
**Duree:** 30-45 min

### Ce qu'on fait
1. **Logo usage:**
   - Versions du logo (principal, monochrome, negatif, favicon)
   - Zone de protection (espace vide autour du logo)
   - Taille minimum
   - Ce qu'il ne faut PAS faire (deformer, recolorier, tourner, etc.)
2. **Palette:**
   - Couleurs primaires, secondaires, neutres avec codes (Hex, RGB, OKLCH, CMYK pour print)
   - Ratios d'utilisation (80% neutre, 15% primaire, 5% accent)
   - Combinaisons autorisees et interdites
3. **Typographie:**
   - Fonts, tailles, graisses
   - Hierarchie (h1, h2, body, caption)
   - Regles d'espacement
4. **Imagerie:**
   - Style photo (filtre, cadrage, ambiance)
   - Style illustration (si applicable)
   - Icones (style, epaisseur, source)
5. **Ton de voix:**
   - Comment la marque parle (formule, ton, registre)
   - Mots a utiliser vs mots a eviter
   - Exemples par contexte (site web, email, social, support)
6. **Templates:**
   - Carte de visite
   - Signature email
   - Post social media (template)
   - En-tete document

### Livrable
`{projet}/_focus-output/branding/guidelines.html` (ou .pdf)

### GATE 5 — Charte complete
- [ ] Logo: toutes les versions + regles d'usage
- [ ] Palette: tous les codes couleurs + ratios
- [ ] Typo: hierarchie complete
- [ ] Ton de voix defini avec exemples
- [ ] Au moins 2 templates fournis
- [ ] Charte validee

---

## ETAPE 6 — Declinaisons

**Pourquoi cette etape:** La charte est un document. Les declinaisons sont la marque en ACTION. C'est la que tu vois si le systeme tient — si le logo fonctionne sur un post Instagram, si les couleurs rendent bien sur un site, si la typo est lisible sur un flyer.

**Agent:** tommy (creation), dre (digital), tasha (copy des templates)
**Duree:** 1-2h

### Ce qu'on fait
1. **Social media:**
   - Template post Instagram (feed 1:1)
   - Template stories (9:16)
   - Template carrousel
   - Cover Facebook / LinkedIn / YouTube
   - Photo de profil (logo adapte au cercle)
2. **Print (si applicable):**
   - Carte de visite (recto/verso)
   - Flyer / brochure
   - Packaging produit
   - Signalétique
3. **Web:**
   - Design system CSS/Tailwind avec les tokens de la charte
   - Composants UI de base (boutons, cartes, inputs, navigation)
   - Favicon + OG image
   - Email template (newsletter, transactionnel)
4. **Documents:**
   - Template presentation (slides)
   - Template devis / facture
   - Signature email

### Livrable
`{projet}/_focus-output/branding/declinaisons/` (dossier avec tous les assets)

### Gate finale — Branding complet
- [ ] Logo en toutes versions (SVG + PNG + favicon)
- [ ] Charte graphique documentee
- [ ] Templates social media prets a l'emploi
- [ ] Design system web exporte (tokens CSS/Tailwind)
- [ ] Au moins 5 declinaisons realisees
- [ ] Tous les fichiers organises et livres

---

## Quick Flow (version rapide)

Pour une identite express en 1-2h (startup, side project, MVP).

```
QUICK-ADN (10 min) → QUICK-PALETTE (15 min) → QUICK-LOGO (20 min) → QUICK-ASSETS (15 min)
```

### Quick-ADN
- Mission en 1 phrase
- 3 mots-cles visuels
- 1-3 references d'inspiration

### Quick-Palette
- 1 couleur primaire + 1 accent + 2 neutres
- 1 font titres + 1 font body
- Pas de CMYK, juste hex/OKLCH

### Quick-Logo
- 1 concept (logotype simple ou combinaison)
- Version claire + sombre
- Favicon

### Quick-Assets
- Template post Instagram
- Favicon + OG image
- Tokens CSS basiques

---

## Mapping Agents

| Etape | Agent principal | Agents support | Pourquoi cet agent |
|-------|----------------|----------------|---------------------|
| 1 Brainstorm | tommy | ghost, storm | tommy = branding, ghost = strategie, storm = recherche refs |
| 2 Moodboard | tommy | storm | tommy = direction artistique, storm = collecte references |
| 3 Palette + Typo | tommy | dre | tommy = choix creatif, dre = implementation technique |
| 4 Logo | tommy | ghost | tommy = creation, ghost = validation strategique |
| 5 Guidelines | tommy | dre | tommy = regles visuelles, dre = mise en forme |
| 6 Declinaisons | tommy | dre, tasha | tommy = DA, dre = digital, tasha = copy templates |

---

## Dossier de sortie

```
{projet}/
└── _focus-output/
    └── branding/
        ├── identite.md
        ├── moodboard.html
        ├── palette-typo.md
        ├── logo-concepts/
        ├── guidelines.html
        └── declinaisons/
            ├── social/
            ├── print/
            ├── web/
            └── documents/
```
