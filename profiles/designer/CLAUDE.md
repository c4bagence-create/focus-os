# CLAUDE.md — Profil DESIGNER

> Profil optimise pour les designers et Art Directors. Visuels, branding, UI/UX.

## Identite

```yaml
profil: Designer / Art Director
style: Premium UI/UX, pixel-perfect, aesthetique
langue: Francais (tutoiement)
format: Visuel d'abord, code si necessaire
```

## Stack visuelle

- **Design System:** Tailwind v4 OKLCH (couleurs perceptuellement uniformes)
- **Animations:** GSAP, Framer Motion, CSS Transitions
- **Composants:** shadcn/ui, Aceternity UI, MagicUI
- **Outils:** Figma, Ideogram, Midjourney
- **Prototypage:** Vercel v0, Bolt.new

## Agents prioritaires

| Agent | Quand l'utiliser |
|-------|-----------------|
| **dre** | Implementation UI, composants, responsive, dark mode |
| **tommy** | Branding, identite visuelle, image prompts, palette |
| **storm** | Veille tendances design, analyse concurrence visuelle |
| **ghost** | Decisions visuelles strategiques, brief design |
| **light** | QA performance Lighthouse, accessibilite WCAG |

## Conventions design

- **Couleurs:** OKLCH obligatoire (gamut display-p3, perceptuellement uniforme)
- **Typo:** Google Fonts variable ou system-ui par defaut
- **Spacing:** Tailwind scale (base 4px)
- **Responsive:** Mobile-first TOUJOURS
- **Dark mode:** Prevoir les deux variants des le debut

## Palette de base (a personnaliser par projet)

```css
/* OKLCH — plus expressif que HEX/HSL */
--color-primary: oklch(0.55 0.20 280);    /* Indigo profond */
--color-accent: oklch(0.70 0.25 330);     /* Magenta vif */
--color-bg: oklch(0.10 0 0);             /* Noir profond */
--color-text: oklch(0.95 0 0);           /* Blanc casse */
```

## Exemples de prompts typiques

```
# Creer une identite visuelle
"Tommy genere une identite visuelle complete pour [marque]:
palette OKLCH, typo, logo concept, moodboard. Style: [premium/dark/minimal]."

# Implementer un composant
"Dre code un hero section pour [projet] en Tailwind v4.
Inspiration: [URL ou description]. Mobile-first, dark mode inclus."

# Veille design
"Storm fait une analyse des tendances design 2026 dans [secteur].
Top 5 patterns visuels avec exemples concrets et sources."
```

## Ressources design

- **Inspiration:** dribbble.com, mobbin.com, awwwards.com, dark.design
- **Composants:** ui.shadcn.com, ui.aceternity.com, magicui.design
- **Icones:** lucide.dev, phosphoricons.com
- **Fonts:** fonts.google.com (variable fonts prioritaires)
- **Images AI:** ideogram.ai, midjourney.com

## Prompts image de base

```
# Branding premium (Ideogram)
[NOM PRODUIT], brand identity, minimal luxury, dark background,
gold typography, product mockup, ultra HD, 4K

# Hero landing (Midjourney)
premium [PRODUIT], cinematic lighting, dark moody, professional photography,
tech startup aesthetic, --ar 16:9 --v 6
```
