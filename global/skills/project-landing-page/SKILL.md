---
name: project-landing-page
description: Chemin complet pour creer une landing page de A a Z. Du brief au deploy avec analytics. Anti-zigzag — chaque etape est obligatoire, dans l'ordre.
trigger: /project landing page
---

# PROJECT TYPE: Landing Page

> Tu veux une landing page ? Voici le chemin COMPLET.
> Pas de zigzag — chaque etape produit un livrable, chaque gate valide avant de passer a la suite.
> Duree estimee: 1-3 heures (Quick Flow) / 1 jour (Full)

---

## Vue d'ensemble

```
ETAPE 1: Brief               → Objectif + cible + contraintes
  ↓ GATE 1: Brief valide
ETAPE 2: Design system check  → Palette, typo, composants
  ↓ GATE 2: Design system pret
ETAPE 3: Wireframe            → Structure de la page
  ↓ GATE 3: Wireframe valide
ETAPE 4: Developpement        → Code HTML/CSS/JS
  ↓ GATE 4: Dev complet
ETAPE 5: Copy                 → Textes definitifs
  ↓ GATE 5: Copy validee
ETAPE 6: Tests responsive     → Mobile, tablette, desktop
  ↓ GATE 6: Tests OK
ETAPE 7: Deploy               → Mise en ligne
  ↓ GATE 7: Live et fonctionnel
ETAPE 8: Monitoring           → Analytics + suivi conversions
```

**Resultat final:** Landing page live + analytics configure + taux de conversion mesure.

---

## ETAPE 1 — Brief

**Pourquoi cette etape:** Une landing page sans objectif clair, c'est une page decorative. Le brief force a repondre a LA question qui compte: quelle action tu veux que le visiteur fasse ?

**Agent:** ghost (strategie)
**Skills a charger:** `copywriting` (hooks)
**Duree:** 10-15 min

### Ce qu'on fait
1. **Objectif unique:** La page a UNE action cible (achat, inscription, prise de RDV, download...)
2. **Cible:** Qui va voir cette page ? D'ou ils viennent (ads, SEO, email, social) ?
3. **Proposition de valeur:** Pourquoi le visiteur devrait faire l'action (en 1 phrase)
4. **Contraintes:** Budget, deadline, stack technique, domaine/hebergement
5. **References:** 2-3 pages d'inspiration (look & feel)
6. **Tracking:** Quels evenements mesurer (clicks CTA, scroll depth, conversions)

### Livrable
`{projet}/_focus-output/landing/brief.md`

### GATE 1 — Brief valide
- [ ] Objectif unique et mesurable defini
- [ ] Cible et source de trafic identifiees
- [ ] Proposition de valeur en 1 phrase
- [ ] Brief valide

---

## ETAPE 2 — Design system check

**Pourquoi cette etape:** Si la marque a deja une charte graphique, la landing doit la respecter. Si elle n'en a pas, il faut en definir une AVANT de dessiner — sinon on refait 3 fois.

**Agent:** tommy (branding), dre (design)
**Duree:** 10-15 min

### Ce qu'on fait
1. **Verifier si un design system existe** pour la marque (palette, typo, composants)
2. **Si oui:** Extraire les tokens a utiliser (couleurs, fonts, spacings, radii)
3. **Si non:** Definir un mini design system:
   - Palette: 1 couleur primaire, 1 secondaire, 1 background, 1 texte
   - Typo: 1 font titres, 1 font body (Google Fonts ou variable font)
   - Spacings: echelle 4px (4, 8, 16, 24, 32, 48, 64, 96)
   - Borders: radius et style de boutons
   - Animations: type et duree (smooth, energique, minimaliste)
4. **Composants identifies:** Hero, features, testimonials, CTA, footer, etc.

### Livrable
`{projet}/_focus-output/landing/design-system.md`

### GATE 2 — Design system pret
- [ ] Palette definie (hex ou OKLCH)
- [ ] Typographie choisie et testee
- [ ] Composants cles identifies
- [ ] Coherent avec la marque existante
- [ ] Direction artistique validee

---

## ETAPE 3 — Wireframe

**Pourquoi cette etape:** Coder sans wireframe, c'est construire une maison sans plan. Le wireframe definit la STRUCTURE — quoi va ou — avant de perdre du temps sur les details visuels.

**Agent:** dre (UX/UI)
**Duree:** 15-20 min

### Ce qu'on fait
1. **Structure de la page** (sections dans l'ordre):
   - Hero: headline + sous-titre + CTA principal + visuel
   - Social proof: logos clients/partenaires ou chiffres cles
   - Probleme: ce que le visiteur vit (douleur)
   - Solution: comment on resout le probleme
   - Features/Benefices: 3-6 points forts
   - Temoignages/Avis: preuve sociale
   - Pricing (si applicable)
   - FAQ
   - CTA final: derniere chance de convertir
   - Footer
2. **Hierarchie visuelle:** Qu'est-ce qui attire l'oeil en premier ?
3. **Flux de lecture:** Le regard descend naturellement vers le CTA
4. **Mobile-first:** La structure doit fonctionner sur mobile AVANT desktop

### Livrable
`{projet}/_focus-output/landing/wireframe.md` (description textuelle) ou screenshot Figma

### GATE 3 — Wireframe valide
- [ ] Toutes les sections necessaires sont presentes
- [ ] CTA visible sans scroller (above the fold)
- [ ] Flux logique: probleme → solution → preuve → CTA
- [ ] Structure mobile-first pensee
- [ ] Wireframe valide

---

## ETAPE 4 — Developpement

**Pourquoi cette etape:** C'est la ou le wireframe devient reel. Le code transforme la maquette en page interactive, rapide, et accessible.

**Agent:** dre (frontend principal)
**Duree:** 30-60 min

### Ce qu'on fait
1. **Stack:** HTML + Tailwind (ou CSS custom) + JS vanilla (ou framework si projet existant)
2. **Sections codees** dans l'ordre du wireframe
3. **Animations:** Scroll reveals, hover states, micro-interactions (pas de surcharge)
4. **Performance:**
   - Images optimisees (WebP, lazy loading)
   - CSS/JS minifies
   - Font preload
   - < 3s de chargement sur 3G
5. **Accessibilite:**
   - Alt text sur les images
   - Contraste suffisant (WCAG AA)
   - Navigation clavier
   - Semantic HTML (h1, h2, sections, nav, main)
6. **SEO de base:**
   - Title + meta description
   - Open Graph tags
   - Schema markup si pertinent

### Livrable
Code source de la landing page

### GATE 4 — Dev complet
- [ ] Toutes les sections codees selon le wireframe
- [ ] Animations fluides (pas de saccade)
- [ ] Performance: < 3s chargement
- [ ] Lighthouse score > 90 sur les 4 categories
- [ ] HTML semantique et accessible

---

## ETAPE 5 — Copy

**Pourquoi cette etape:** Le design attire l'oeil, mais c'est le TEXTE qui convainc. Une landing avec un mauvais texte ne convertit pas, meme si elle est belle. La copy se fait APRES le dev pour s'adapter a l'espace disponible.

**Agent:** tasha (copy principale), ghost (validation strategie)
**Skills a charger:** `copywriting` (frameworks, hooks, CTA)
**Duree:** 20-30 min

### Ce qu'on fait
1. **Headline:** La promesse principale (max 10 mots, un seul benefice clair)
2. **Sous-titre:** L'explication de la promesse (1-2 phrases)
3. **Body copy:** Chaque section a son propre micro-argumentaire
4. **CTA:** Texte du bouton (pas "Envoyer" mais "Recevoir mon guide gratuit")
5. **Social proof:** Formulation des temoignages, chiffres
6. **FAQ:** Les vraies objections transformees en reponses rassurantes
7. **Micro-copy:** Petits textes qui reassurent (autour des formulaires, sous les CTA)

### Livrable
Textes integres dans la landing page

### GATE 5 — Copy validee
- [ ] Headline = 1 benefice clair en < 10 mots
- [ ] CTA = action specifique (pas generique)
- [ ] Ton coherent avec la marque
- [ ] Objections principales traitees dans la FAQ
- [ ] Zero faute d'orthographe
- [ ] Copy validee

---

## ETAPE 6 — Tests responsive

**Pourquoi cette etape:** 60%+ du trafic web est mobile. Si la page est cassee sur telephone, tu perds plus de la moitie de tes visiteurs avant meme qu'ils lisent un mot.

**Agent:** light (QA), dre (fixes)
**Duree:** 15-20 min

### Ce qu'on fait
1. **Tester sur 5 breakpoints:**
   - Mobile portrait (375px — iPhone SE)
   - Mobile landscape (667px)
   - Tablette (768px)
   - Desktop (1280px)
   - Large desktop (1920px)
2. **Verifier:**
   - Textes lisibles (pas trop petits, pas coupes)
   - Images pas deformees
   - Boutons cliquables (zone tactile > 44px)
   - Pas de scroll horizontal
   - Formulaires utilisables au doigt
   - Menu fonctionne (burger mobile)
3. **Tester sur vrais navigateurs:** Chrome, Safari, Firefox
4. **Dark mode** (si applicable)
5. **Accessibilite:** VoiceOver / screen reader rapide

### Livrable
`{projet}/_focus-output/landing/test-report.md`

### GATE 6 — Tests OK
- [ ] 5 breakpoints testes et fonctionnels
- [ ] Aucun element casse ou cache
- [ ] CTA visible et cliquable partout
- [ ] Formulaires fonctionnels sur mobile
- [ ] Chrome + Safari OK

---

## ETAPE 7 — Deploy

**Pourquoi cette etape:** Une page locale ne sert a rien. Le deploy met la page en ligne pour que le monde la voie. C'est aussi le moment de s'assurer que tout est securise et rapide en production.

**Agent:** dre (deploy Vercel) ou tate (deploy custom)
**Duree:** 10-15 min

### Ce qu'on fait
1. **Pre-deploy checklist:**
   - Domaine configure (DNS, CNAME/A record)
   - HTTPS force
   - Favicon present
   - 404 page configuree
   - Meta tags finaux (title, description, OG image)
2. **Deploy:**
   - Push vers Vercel / Hostinger / plateforme choisie
   - Verifier que le site charge
   - Tester le formulaire en prod
   - Verifier les redirections si necessaire
3. **Post-deploy:**
   - Test sur mobile en prod (URL reelle, pas localhost)
   - Verifier le SSL (cadenas vert)
   - Test de vitesse (PageSpeed Insights)

### Livrable
URL live de la landing page

### GATE 7 — Live et fonctionnel
- [ ] URL accessible publiquement
- [ ] HTTPS actif
- [ ] Formulaire/CTA fonctionne en prod
- [ ] Vitesse acceptable (PageSpeed > 90)
- [ ] Page live validee

---

## ETAPE 8 — Monitoring

**Pourquoi cette etape:** Une landing sans analytics, c'est conduire les yeux fermes. Tu ne sais pas combien de gens visitent, combien convertissent, ou ils partent. Sans ces donnees, tu ne peux PAS ameliorer.

**Agent:** ghost (strategie), storm (outils)
**Duree:** 10-15 min

### Ce qu'on fait
1. **Analytics:**
   - Google Analytics 4 OU Plausible (privacy-friendly)
   - Evenements: page view, scroll depth, click CTA, form submit
   - Source de trafic tracke (UTM parameters)
2. **Conversion tracking:**
   - Pixel Meta (si Facebook Ads)
   - Google Ads tag (si Google Ads)
   - Conversion event = l'action cible du brief
3. **Heatmap (optionnel mais recommande):**
   - Hotjar ou Microsoft Clarity (gratuit)
   - Voir ou les gens cliquent et ou ils partent
4. **Alertes:**
   - Si le taux de conversion tombe sous X% → notification
   - Si le temps de chargement depasse 5s → notification

### Livrable
`{projet}/_focus-output/landing/monitoring-setup.md`

### Gate finale — Landing complete
- [ ] Page live et fonctionnelle
- [ ] Analytics installe et qui remonte des donnees
- [ ] Conversion tracking actif
- [ ] Premieres donnees visibles dans le dashboard
- [ ] Pret a recevoir du trafic

---

## Quick Flow (version rapide)

Pour une landing simple en 1-2h.

```
QUICK-BRIEF (5 min) → QUICK-BUILD (45 min) → QUICK-COPY (15 min) → QUICK-DEPLOY (10 min)
```

### Quick-Brief
- Objectif + cible + CTA en 3 lignes
- 1 reference d'inspiration

### Quick-Build
- dre code directement a partir du brief
- Structure standard: Hero → Features → Social Proof → CTA → Footer
- Mobile-first, Tailwind

### Quick-Copy
- tasha ecrit headline + sous-titre + CTA + 3 features
- ghost valide la coherence avec la marque

### Quick-Deploy
- Push Vercel + analytics basique (Plausible ou GA4)
- URL live en 5 min

---

## Mapping Agents

| Etape | Agent principal | Agents support | Pourquoi cet agent |
|-------|----------------|----------------|---------------------|
| 1 Brief | ghost | — | ghost = vision strategie, definit l'objectif |
| 2 Design system | tommy | dre | tommy = branding, dre = implementation design |
| 3 Wireframe | dre | — | dre = expert UX/UI, structure de page |
| 4 Dev | dre | — | dre = frontend, code la page |
| 5 Copy | tasha | ghost | tasha = copywriting, ghost = validation strategie |
| 6 Tests | light | dre | light = QA, dre = fixes |
| 7 Deploy | dre/tate | — | dre = Vercel, tate = infra custom |
| 8 Monitoring | ghost | storm | ghost = metriques, storm = outils |

---

## Dossier de sortie

```
{projet}/
└── _focus-output/
    └── landing/
        ├── brief.md
        ├── design-system.md
        ├── wireframe.md
        ├── test-report.md
        └── monitoring-setup.md
```
