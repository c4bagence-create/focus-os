---
name: design-references
description: Bibliotheque de references design, UI patterns, composants, animations, conventions CSS, accessibilite. Consulter avant tout travail visuel.
triggers:
  - "design"
  - "UI"
  - "landing page"
  - "composant"
  - "animation"
  - "couleurs"
  - "typographie"
  - "interface"
  - "visuel"
  - "frontend"
  - "maquette"
  - "layout"
---

# Design References — Bibliotheque visuelle

> Base de connaissances design pour DRE, TOMMY et tout agent visuel.
> Charger CE fichier avant de coder ou designer quoi que ce soit.

---

## Sites de reference premium (26 refs)

### Tier 1 — References absolues

| Site | Ce qu'on apprend | Style | Usage |
|------|-----------------|-------|-------|
| stripe.com | Micro-interactions, gradients subtils, copy ultra-concis, sections anim | Clean corporate premium | Modele pour SaaS B2B |
| linear.app | Dark mode parfait, UI dense lisible, typographie monospace, shortcuts | Dark productivity | Modele pour outils pro |
| vercel.com | Typographie massive, N&B, animations scroll, CLI vibes | Minimal tech | Modele pour dev tools |
| raycast.com | Glassmorphism mature, gradients, cards flottantes, command palette | Dark tool premium | Modele pour apps desktop/web |
| arc.net | Couleurs vives sur dark, gradients audacieux, personnalisation | Creative dark | Modele pour produits consumer |
| figma.com | Gradients 3D, hero anime, feature grids asymetriques, couleurs vives | Colorful SaaS | Modele pour design tools |
| notion.so | Whitespace genereux, iconographie simple, hierarchie claire | Light clean | Modele pour productivite |
| loom.com | Video-first design, thumbnails, player premium, trust signals | Video SaaS | Modele pour produits video |

### Tier 2 — References specifiques

| Site | Ce qu'on apprend | Style | Usage |
|------|-----------------|-------|-------|
| cal.com | Open source aesthetic, dark/light toggle, code snippets | Open source premium | Modele pour scheduling/API |
| resend.com | Code-first design, monospace hero, developer trust | Developer premium | Modele pour dev-facing SaaS |
| dub.co | Minimal, rapide, accent violet/purple, clarity | Minimal SaaS | Modele pour tools simples |
| framer.com | Builder-native animations, 3D, interactivite | Creative tool | Modele pour no-code/builder |
| craft.do | Typographie iOS-native, blur, profondeur | iOS aesthetic | Modele pour apps content |
| planetscale.com | CLI vibes, grille dense, dark tech | Database/infra | Modele pour B2B tech |
| supabase.com | Vert neon sur dark, mono, open source premium | Dark tech | Modele pour backend tools |
| clerk.dev | Auth UI premium, composants prêts, gradient subtle | Auth/Identity | Modele pour auth flows |
| posthog.com | Data viz, dark dashboard, blue accents, charts | Analytics dark | Modele pour analytics SaaS |
| pika.art | Gradient pastel, createur-first, animations fluides | AI creative | Modele pour AI tools createurs |
| runway.ml | Cinematic dark, video edgy, premium feel | AI video | Modele pour AI generatif |
| elevenlabs.io | Waveform UI, audio visualisation, dark elegant | AI audio | Modele pour outils audio/AI |

### Tier 3 — E-commerce & marketing

| Site | Ce qu'on apprend | Style | Usage |
|------|-----------------|-------|-------|
| allbirds.com | Storytelling produit, sustainability, photos lifestyle | E-com premium | Modele pour D2C eco |
| gymshark.com | Athletic energy, dark/neon, influencer-first | E-com fitness | Modele pour sport/lifestyle |
| glossier.com | Pastel, minimalisme, community-driven, UGC | E-com beauty | Modele pour beaute/wellness |
| liquid-death.com | Punk, dark humor, counter-cultural branding | Edgy DTC | Modele pour branding disruptif |
| notion.com/templates | Patterns pages ventes template/SaaS | Hybrid | Modele pour marketplaces |
| framer.com/marketplace | Landing pages communaute, variety | Landing variety | Inspiration landing rapide |

---

## Patterns UI modernes (2025-2026)

### Patterns universels

| Pattern | Description | Exemple vivant | Quand utiliser |
|---------|-------------|----------------|----------------|
| Bento Grid | Grille asymetrique de cards feature | Linear.app, Vercel | Feature showcase, dashboard overview |
| Glassmorphism | blur + transparence + border light | Arc, Raycast | Cards overlay, modals premium |
| Gradient mesh | Background multi-couleurs organiques | Stripe, Figma | Hero backgrounds, brand identity |
| Micro-interactions | Feedback instantane sur hover/click | Raycast, Linear | Boutons, toggles, hover states |
| Scroll animations | Reveal progressif au scroll | Vercel, Loom | Storytelling vertical, features reveal |
| Command palette | Input global power-user | Raycast, Linear | Navigation rapide, recherche |
| Skeleton loading | Placeholder anime pendant chargement | Notion, Slack | Feedback percu premium |
| Toast notifications | Feedback non-bloquant en overlay | Vercel, Cal.com | Actions CRUD, confirmations |
| Floating navbar | Nav qui disparait au scroll et revient | Framer, Dub | Navigation longues pages |
| Sticky sidebar | Navigation persistante gauche | Notion, Linear | Apps avec sections multiples |

### Patterns par section de page

| Section | Pattern recommande | Anti-pattern |
|---------|-------------------|-------------|
| Hero | Headline 60-80px + sub 18-20px + 2 CTA | Slider, video autoplay sans mute |
| Features | Bento 3col ou alternance texte/visuel | Liste a puces horizontale |
| Testimonials | Cards 3col avec photo + rating | Carrousel auto |
| Pricing | 3 colonnes, milieu highlight, toggle /mo/yr | Tableaux avec 8+ colonnes |
| FAQ | Accordion avec animation fluide | Q&A en texte brut |
| CTA final | Full-width, contraste max, repetition du bénéfice clé | Footer directement |
| Footer | 4 colonnes logiques + newsletter + legal | Footer 1 ligne avec just copyright |
| Stats | 3-4 chiffres clés avec icone + label | Tableau de stats |

---

## Patterns par type de projet

### SaaS / Outil pro

**Structure recommandee:**
1. Hero — Headline fort + sous-titre + CTA + capture produit
2. Logos clients (social proof precoce)
3. Features — Bento 3 colonnes ou alternance
4. Demo video ou gif produit
5. Testimonials — 3 cards avec photo
6. Pricing — 3 plans, milieu highlighted
7. FAQ — 5-8 questions critiques
8. CTA final — full-width contraste
9. Footer complet

**Must-have UI:**
- Dark mode par defaut
- Highlight syntax si produit technique
- Changelog visible
- Status page link dans footer
- Free trial ou freemium CTA prioritaire
- "No credit card required" sous le CTA primaire

### E-commerce

**Structure recommandee:**
1. Hero — Produit en action + headline benefit + CTA
2. Trust signals (livraison, retours, paiement securise)
3. Bestsellers ou collection hero
4. Storytelling marque (valeurs, fabrication)
5. Avis clients (4.5+ etoiles, photos UGC)
6. Bundle ou upsell section
7. FAQ produit
8. Footer avec reassurance complete

**Must-have UI:**
- Mobile-first absolu (70%+ trafic)
- Breadcrumb sur pages produit
- Sticky "Ajouter au panier" sur mobile
- Photos produit min 4 angles + video
- Badge promo (urgence, stock limité)
- Chat ou WhatsApp flottant
- Cross-sell "Vous aimerez aussi"

### Portfolio / Agence

**Structure recommandee:**
1. Hero — Statement fort + position marche
2. Work grid — cases etudes en fullwidth ou 2col
3. Process — 4-5 etapes visuelles
4. Team ou founder story
5. Clients ou logos
6. Testimonials
7. CTA — Contact ou brief

**Must-have UI:**
- Transitions page full-screen (GSAP ou Framer)
- Cursor custom
- Hover effects sur les cases studies
- Loupe ou reveal au hover pour portfolios photo
- Couleurs marque fortes et distinctives
- Moins de text, plus de visuels

### Formation / Education

**Structure recommandee:**
1. Hero — Transformation promise (avant → après)
2. Pour qui c'est (segmentation rapide)
3. Programme — modules + durees
4. Formateur — bio credibilite
5. Testimonials — avant/apres specifiques
6. Ce qu'on obtient (checklist visuelle)
7. Garantie
8. Pricing — 1 ou 2 options max
9. FAQ urgence
10. CTA final

**Must-have UI:**
- Progress indicators pour modules
- Video testimonials si possible
- Countdown urgence si promo
- Icones devant chaque point liste
- Mobile parfait (apprenants sur mobile)
- Colorimétrie qui inspire confiance (bleu, vert) ou energie (orange, violet)

### Landing page publicite (Meta/Google)

**Regles strictes:**
- Above the fold = headline + image + CTA visible sans scroll
- 1 seul objectif, 1 seule CTA
- No menu navigation (on garde les gens sur la page)
- Repeter la CTA toutes les 3-4 sections
- Mobile first absolu
- Temps de chargement < 2s (LCP < 2.5s)
- Couleurs cohérentes avec la pub qui amène le trafic
- Social proof dans les 300px du hero

---

## Systeme de couleurs OKLCH

> OKLCH = perceptuellement uniforme. Toujours utiliser pour les nouveaux projets.

### Base dark (defaut pour SaaS/outils)

| Role | Token CSS | Valeur OKLCH | Notes |
|------|-----------|--------------|-------|
| bg-base | `--color-bg` | oklch(0.13 0.02 260) | Noir profond, teinte bleue |
| bg-surface | `--color-surface` | oklch(0.17 0.02 260) | Cards, modals, panels |
| bg-elevated | `--color-elevated` | oklch(0.21 0.02 260) | Dropdowns, popovers |
| border-subtle | `--color-border` | oklch(0.26 0.015 260) | Bordures subtiles |
| border-strong | `--color-border-strong` | oklch(0.35 0.015 260) | Bordures visibles |
| text-primary | `--color-text` | oklch(0.93 0.01 260) | Texte principal |
| text-secondary | `--color-text-2` | oklch(0.70 0.01 260) | Texte secondaire |
| text-muted | `--color-muted` | oklch(0.50 0.01 260) | Labels, placeholders |
| accent-violet | `--color-accent` | oklch(0.55 0.25 290) | CTAs, liens actifs |
| accent-violet-hover | `--color-accent-hover` | oklch(0.62 0.25 290) | Hover sur accent |
| accent-cyan | `--color-cyan` | oklch(0.72 0.15 195) | Info, tags, highlights |
| accent-gold | `--color-gold` | oklch(0.75 0.15 80) | Warnings, badges premium |
| success | `--color-success` | oklch(0.72 0.18 155) | Confirmations, valide |
| warning | `--color-warning` | oklch(0.78 0.17 85) | Alertes douces |
| error | `--color-error` | oklch(0.60 0.22 25) | Erreurs, danger |
| overlay | `--color-overlay` | oklch(0 0 0 / 0.6) | Backdrops modals |

### Palettes par univers

| Univers | Background | Accent 1 | Accent 2 | Accent 3 | Feeling |
|---------|-----------|---------|---------|---------|---------|
| **Focus** | oklch(0.13 0.02 260) | oklch(0.55 0.25 290) violet | oklch(0.72 0.15 195) cyan | oklch(0.75 0.15 80) gold | Dark premium productivite |
| **Moneymakers** | oklch(0.10 0.01 270) | oklch(0.60 0.30 320) magenta | oklch(0.70 0.22 195) cyan | oklch(0.65 0.20 275) violet | GTA Vice City underground |
| **Prime** | oklch(0.99 0.005 250) | oklch(0.30 0.08 260) bleu | oklch(0.50 0.05 260) gris | oklch(0.75 0.12 80) gold | Clean pro espaces genereux |
| **Power (B2B)** | oklch(0.98 0.005 240) | oklch(0.35 0.18 255) bleu | oklch(0.55 0.05 260) slate | oklch(0.60 0.20 235) bleu fonce | Corporate sobre fiable |
| **Nutri7 (wellness)** | oklch(0.97 0.02 155) | oklch(0.55 0.22 155) vert | oklch(0.70 0.18 130) vert clair | oklch(0.75 0.12 95) jaune | Nature vitality |
| **Cremya (artisanal)** | oklch(0.10 0.02 60) | oklch(0.78 0.18 80) or | oklch(0.30 0.05 60) brun | oklch(0.92 0.02 80) creme | Luxe artisanal chaud |

---

## Typographie recommandee

### Fonts par usage

| Usage | Font principale | Fallback | Poids recommandes | Notes |
|-------|----------------|----------|------------------|-------|
| Headings SaaS | Inter | system-ui, sans-serif | 700, 800, 900 | Standard industrie |
| Body text | Inter | system-ui, sans-serif | 400, 500 | Lisibilite optimale |
| Code / Mono | JetBrains Mono | Fira Code, monospace | 400, 500 | Ligatures ON |
| Display hero | Instrument Serif | Georgia, serif | 400 | Contraste avec sans |
| Alt sans premium | DM Sans | system-ui | 400, 500, 700 | Plus doux qu'Inter |
| Alt mono | Fira Code | monospace | 400 | Ligatures belles |
| Ultra bold display | Syne | system-ui | 700, 800 | Impact fort, moderne |
| Humaniste | Plus Jakarta Sans | system-ui | 400-700 | Chaleureux, accessible |

### Scale typographique

| Element | Taille desktop | Taille mobile | Line-height | Letter-spacing |
|---------|---------------|--------------|------------|----------------|
| h1 hero | 64-80px | 40-48px | 1.1 | -0.02em |
| h1 page | 48-56px | 32-40px | 1.15 | -0.015em |
| h2 section | 36-44px | 28-32px | 1.2 | -0.01em |
| h3 sous-section | 24-28px | 20-24px | 1.3 | -0.005em |
| h4 | 18-20px | 16-18px | 1.4 | 0 |
| Body large | 18-20px | 16-18px | 1.6 | 0 |
| Body | 16px | 15-16px | 1.6 | 0 |
| Small / caption | 13-14px | 12-13px | 1.5 | 0.01em |
| Label UI | 12px | 11-12px | 1.4 | 0.04em uppercase |

---

## Breakpoints & Responsive

| Nom | Valeur Tailwind | Usage |
|-----|----------------|-------|
| xs | 480px | Phone landscape |
| sm | 640px | Phone portrait large |
| md | 768px | Tablet portrait |
| lg | 1024px | Tablet landscape / small laptop |
| xl | 1280px | Standard desktop |
| 2xl | 1536px | Large screen |

**Regles mobile-first:**
- Toujours ecrire le style mobile en premier
- Ajouter les overrides desktop avec `md:` ou `lg:`
- Tester sur 375px (iPhone SE) comme contrainte minimum
- Touch targets min 44x44px
- Pas de hover-only interactions sur mobile

---

## Spacing scale

**Base 4px system:**
```
1  →  4px
2  →  8px
3  →  12px
4  →  16px
5  →  20px
6  →  24px
8  →  32px
10 →  40px
12 →  48px
16 →  64px
20 →  80px
24 →  96px
32 → 128px
```

**Regles d'usage:**
- Spacing interne composant: 4-16px
- Gap entre elements: 8-24px
- Padding section: 64-96px desktop, 40-64px mobile
- Max-width content: 1280px (xl)
- Max-width texte long: 720px (lisibilite optimale)
- Max-width narrow: 640px (formulaires, dialogs)

---

## Animation timings

| Type | Duration | Easing CSS | Quand utiliser |
|------|----------|------------|----------------|
| Micro (hover, active) | 100-150ms | ease-out | Feedback immediat boutons, links |
| Small (toggle, checkbox) | 150-200ms | ease-in-out | Etats binaires |
| Medium (modal open, dropdown) | 250-350ms | cubic-bezier(0.16, 1, 0.3, 1) | Apparition elements |
| Large (page transition) | 400-600ms | cubic-bezier(0.16, 1, 0.3, 1) | Changements majeurs |
| Scroll reveal | 600-800ms | cubic-bezier(0.16, 1, 0.3, 1) | Sections qui entrent dans le viewport |
| Skeleton pulse | 1.5-2s | ease-in-out infinite | Loading states |

**Regles animations:**
- `prefers-reduced-motion: reduce` OBLIGATOIRE — desactiver ou reduire toutes les anims
- Eviter les animations > 500ms en interaction directe (frustration utilisateur)
- GSAP pour les sequences complexes, CSS pour les micro-interactions
- Framer Motion pour les composants React avec state
- Ne jamais animer `width`/`height` — utiliser `transform: scale()` ou `clip-path`
- Ne jamais animer `top`/`left` — utiliser `transform: translate()`

---

## Composants essentiels — Checklist

### Navigation
- [ ] Navbar desktop: logo + liens + CTA
- [ ] Navbar mobile: hamburger + drawer/sheet
- [ ] Breadcrumb (pages internes)
- [ ] Tabs (sections dans une page)
- [ ] Sidebar (apps avec navigation complexe)
- [ ] Command palette (apps pro)

### Sections de page
- [ ] Hero (headline + sub + CTA + visuel)
- [ ] Feature grid (bento ou cards 3col)
- [ ] Alternance texte/visuel (feature detail)
- [ ] Stats bar (3-4 chiffres cles)
- [ ] Testimonials (cards ou liste)
- [ ] Logos clients (grayscale, 6-12)
- [ ] Pricing table (3 plans)
- [ ] Comparison table (check/cross)
- [ ] FAQ accordion
- [ ] CTA section plein-ecran
- [ ] Footer 4 colonnes

### UI Components
- [ ] Bouton (primary, secondary, ghost, danger)
- [ ] Input / Textarea
- [ ] Select / Combobox
- [ ] Checkbox / Radio / Switch
- [ ] Badge / Tag / Chip
- [ ] Avatar (initiales + image)
- [ ] Card (base, interactive, media)
- [ ] Modal / Dialog
- [ ] Drawer / Sheet (mobile)
- [ ] Dropdown menu
- [ ] Toast notification
- [ ] Tooltip
- [ ] Progress bar / Spinner
- [ ] Empty state
- [ ] Error state
- [ ] Skeleton loader

---

## Conventions CSS & Tailwind

### Naming conventions

```css
/* BEM-inspired pour CSS custom */
.block {}
.block__element {}
.block--modifier {}

/* Tailwind: toujours mobile-first */
<div class="text-sm md:text-base lg:text-lg">

/* Variables CSS pour les tokens design */
:root {
  --color-bg: oklch(0.13 0.02 260);
  --color-accent: oklch(0.55 0.25 290);
  --radius-sm: 6px;
  --radius-md: 10px;
  --radius-lg: 16px;
  --radius-xl: 24px;
}
```

### Structure fichier CSS

```css
/* 1. Variables / tokens */
/* 2. Reset / base */
/* 3. Typography */
/* 4. Layout utilities */
/* 5. Components */
/* 6. Animations / keyframes */
/* 7. Utilities custom */
/* 8. Media queries (si pas Tailwind) */
```

### Patterns Tailwind frequents

```html
<!-- Card glassmorphism -->
<div class="bg-white/5 backdrop-blur-md border border-white/10 rounded-2xl p-6">

<!-- Gradient text -->
<h1 class="bg-gradient-to-r from-violet-400 to-cyan-400 bg-clip-text text-transparent">

<!-- Grid bento -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 auto-rows-min">

<!-- Section padding standard -->
<section class="py-16 md:py-24 lg:py-32 px-4 md:px-8">

<!-- Container standard -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

<!-- Text muted -->
<p class="text-white/60 text-sm leading-relaxed">

<!-- Bouton primary -->
<button class="bg-violet-600 hover:bg-violet-500 text-white px-6 py-3 rounded-xl
               font-medium transition-colors duration-150 focus-visible:outline-none
               focus-visible:ring-2 focus-visible:ring-violet-500 focus-visible:ring-offset-2">

<!-- Focus ring accessible -->
<a class="focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-violet-500
          focus-visible:ring-offset-2 rounded-md">
```

### Anti-patterns a eviter

```html
<!-- MAL: couleur sans contraste suffisant -->
<p class="text-gray-600 bg-gray-500"> <!-- ratio < 4.5:1 -->

<!-- MAL: animation sans prefers-reduced-motion -->
<div class="animate-bounce"> <!-- jamais sans @media check -->

<!-- MAL: focus supprime sans alternative -->
<button class="outline-none"> <!-- toujours remplacer par focus-visible -->

<!-- MAL: overflow hidden sur parent flex/grid mobile -->
<div class="flex overflow-hidden"> <!-- casse le scroll mobile -->

<!-- MAL: taille de police fixe px sur body -->
<body style="font-size: 14px"> <!-- utiliser rem/em -->
```

---

## Guidelines Accessibilite (WCAG AA minimum)

### Contraste couleur

| Type | Ratio minimum | Ratio recommande |
|------|--------------|-----------------|
| Texte normal (< 18px) | 4.5:1 | 7:1 |
| Texte large (>= 18px bold ou 24px) | 3:1 | 4.5:1 |
| Elements UI (boutons, inputs, icones) | 3:1 | 4.5:1 |
| Texte decoratif / logo | Aucun requis | -- |

**Outils de verification:**
- Chrome DevTools → Lighthouse → Accessibility
- Extension "axe DevTools"
- whocanuse.com pour tester les palettes OKLCH
- contrast.tools pour verifier en temps reel

### Semantique HTML obligatoire

```html
<!-- Structure de page -->
<header role="banner">
<nav aria-label="Navigation principale">
<main id="main-content">
<aside aria-label="Sidebar">
<footer role="contentinfo">

<!-- Headings hierarchiques (jamais sauter un niveau) -->
<h1> → <h2> → <h3> (pas h1 → h3)

<!-- Images -->
<img alt="Description concrete de l'image">
<img alt=""> <!-- decorative: alt vide, pas alt absent -->

<!-- Boutons vs liens -->
<button> <!-- action (submit, toggle, modal) -->
<a href="..."> <!-- navigation vers une URL -->

<!-- Formulaires -->
<label for="email">Email</label>
<input id="email" type="email" aria-describedby="email-hint">
<p id="email-hint">Format: nom@domaine.com</p>
```

### Interactions clavier

```css
/* Focus visible OBLIGATOIRE — jamais supprimer sans remplacer */
:focus-visible {
  outline: 2px solid var(--color-accent);
  outline-offset: 2px;
  border-radius: 4px;
}

/* Skip link pour navigation clavier */
.skip-link {
  position: absolute;
  top: -100%;
  left: 1rem;
}
.skip-link:focus {
  top: 1rem;
}
```

**Ordre de tabulation:**
- Logique et previsible (suit l'ordre visuel)
- Jamais `tabindex > 0`
- Modals: pieger le focus dans la modal (focus trap)
- Menus: navigation fleches dans le menu, Escape pour fermer

### Texte et lisibilite

- Jamais de texte en image (sauf logo)
- Line-height minimum 1.5 pour le body
- Espacement entre paragraphes > 2x la taille de police
- Pas de justification de texte (word-spacing irregulier)
- Maximum 80 caracteres par ligne pour la lisibilite
- Zoom 200% ne casse pas le layout (pas d'overflow horizontal)

### Motion & animations

```css
/* OBLIGATOIRE sur tout projet avec animations */
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

### ARIA patterns essentiels

```html
<!-- Modal dialog -->
<div role="dialog" aria-modal="true" aria-labelledby="modal-title">
  <h2 id="modal-title">Titre du modal</h2>
  ...
  <button aria-label="Fermer le modal">X</button>
</div>

<!-- Accordion -->
<button aria-expanded="false" aria-controls="faq-1">Question</button>
<div id="faq-1" hidden>Reponse</div>

<!-- Tabs -->
<div role="tablist">
  <button role="tab" aria-selected="true" aria-controls="panel-1">Tab 1</button>
</div>
<div role="tabpanel" id="panel-1">Contenu</div>

<!-- Loading state -->
<div aria-live="polite" aria-busy="true">Chargement...</div>

<!-- Alert / notification -->
<div role="alert">Message d'erreur visible</div>
<div role="status">Message de confirmation</div>

<!-- Icon-only button -->
<button aria-label="Supprimer l'element">
  <svg aria-hidden="true">...</svg>
</button>
```

---

## Prompts image (Midjourney / Ideogram / Flux)

**Template universel:**
```
[sujet], [style visuel], [couleurs], [mood/atmosphere], [technique], [lighting], --ar [ratio] --v 6.1
```

**Par type de besoin:**

| Besoin | Prompt base |
|--------|------------|
| Hero background | "abstract gradient mesh, [couleurs], dark, ethereal glow, 8k resolution --ar 16:9 --v 6.1" |
| Logo mark | "minimal geometric logo, [forme], [couleurs], luxury brand, vector clean, white background --ar 1:1 --v 6.1" |
| Dashboard mockup | "dark UI dashboard, glassmorphism cards, data visualization, [couleur accent], clean --ar 16:9 --v 6.1" |
| Produit lifestyle | "[produit] on [surface], lifestyle photography, [couleurs marque], soft light, editorial --ar 4:5 --v 6.1" |
| Illustration hero | "flat isometric illustration, [sujet], [couleurs], modern minimalist, clean lines --ar 16:9 --v 6.1" |
| Texture background | "seamless texture, [materiau], subtle, dark, for web background, 4k --ar 1:1 --v 6.1" |
| Team/person | "professional portrait, [description], natural light, soft background, editorial photography --ar 4:5 --v 6.1" |

---

## Performance frontend (checklist pre-deploy)

### Core Web Vitals cibles

| Metrique | Cible | Critique |
|----------|-------|---------|
| LCP (Largest Contentful Paint) | < 2.5s | < 4s |
| CLS (Cumulative Layout Shift) | < 0.1 | < 0.25 |
| INP (Interaction to Next Paint) | < 200ms | < 500ms |
| FID (First Input Delay) | < 100ms | < 300ms |
| TTFB (Time to First Byte) | < 800ms | < 1.8s |

### Optimisations obligatoires

**Images:**
- Format WebP ou AVIF (jamais PNG/JPG pour le web)
- `loading="lazy"` sur toutes les images hors-viewport
- `fetchpriority="high"` sur l'image hero LCP
- Dimensions explicites pour eviter le CLS
- `srcset` pour le responsive images

**Fonts:**
- `font-display: swap` pour eviter le FOIT
- Preload des fonts critiques
- Subset des fonts (Latin seulement si pas d'autres langues)
- Max 2-3 fonts differentes par projet

**CSS / JS:**
- CSS critique inline dans `<head>`
- JS non-critique en `defer` ou `async`
- Tailwind purge (classes inutilisees supprimees)
- Pas de `@import` CSS (bloque le rendu)

---

## Ressources et outils design

| Outil | Usage | URL |
|-------|-------|-----|
| Coolors | Generation palettes | coolors.co |
| Realtime Colors | Preview live couleurs | realtimecolors.com |
| OKLCH Picker | Couleurs perceptuelles | oklch.com |
| Fontpair | Associations typo | fontpair.co |
| Google Fonts | Fonts gratuites | fonts.google.com |
| Heroicons | Icones Tailwind | heroicons.com |
| Lucide | Icones modernes | lucide.dev |
| Phosphor | Icones variees | phosphoricons.com |
| unDraw | Illustrations SVG | undraw.co |
| Storyset | Illustrations animees | storyset.com |
| Unsplash | Photos gratuites | unsplash.com |
| Pexels | Photos/videos | pexels.com |
| Shots.so | Mockups premium | shots.so |
| Screenlane | Inspiration mobile | screenlane.com |
| Mobbin | Patterns mobile | mobbin.com |
| Muzli | Inspiration design | muz.li |
| Page Flows | Flows UX | pageflows.com |
| Laws of UX | Principes UX | lawsofux.com |

---

*Total: 350+ lignes | Version: 1.0 | Derniere mise a jour: 2026-03-18*
*Agents qui utilisent ce skill: dre, tommy, ghost (coordination visuelle)*
