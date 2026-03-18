---
name: project-ecommerce
description: Chemin complet pour lancer un e-commerce de A a Z. Du produit aux ads qui tournent. Anti-zigzag — chaque etape est obligatoire, dans l'ordre.
trigger: /project ecommerce
---

# PROJECT TYPE: E-commerce

> Tu veux lancer un e-commerce ? Voici le chemin COMPLET.
> Pas de zigzag — chaque etape produit un livrable, chaque gate valide avant de passer a la suite.
> Duree estimee: 3-5 jours (Quick Flow) / 2-3 semaines (Full)

---

## Vue d'ensemble

```
ETAPE 1: Produit (fiches)         → Quoi vendre, a qui, pourquoi
  ↓ GATE 1: Produit valide
ETAPE 2: Positionnement           → Place sur le marche
  ↓ GATE 2: Positionnement clair
ETAPE 3: Shop setup (Shopify)     → Boutique technique prete
  ↓ GATE 3: Shop fonctionnel
ETAPE 4: Copy produit             → Textes qui vendent
  ↓ GATE 4: Copy validee
ETAPE 5: Photos / Visuels         → Images qui donnent envie
  ↓ GATE 5: Visuels prets
ETAPE 6: Ads setup                → Campagnes publicitaires
  ↓ GATE 6: Ads pretes a lancer
ETAPE 7: Launch                   → Mise en ligne officielle
  ↓ GATE 7: Boutique live
ETAPE 8: Optimisation             → Amelioration continue
```

**Resultat final:** Boutique live + fiches produit qui convertissent + ads qui tournent + metriques suivies.

---

## ETAPE 1 — Produit (fiches)

**Pourquoi cette etape:** Avant de construire une boutique, il faut savoir EXACTEMENT ce qu'on vend, a qui, et pourquoi ces gens acheteraient chez nous plutot qu'ailleurs. Sans ca, on construit une belle vitrine pour un produit que personne ne veut.

**Agent:** ghost (strategie), storm (recherche marche)
**Skills a charger:** `vision360` (recherche exhaustive)
**Duree:** 30-45 min

### Ce qu'on fait
1. **Catalogue produit:**
   - Liste complete des produits/variantes
   - Specifications techniques (poids, dimensions, materiaux, etc.)
   - Prix d'achat / Prix de vente / Marge
   - Fournisseur(s) et delais de livraison
2. **Analyse produit:**
   - Pourquoi CE produit ? (validation marche, tendance, demande)
   - Concurrence directe (qui vend la meme chose, a quel prix)
   - Differentiation (pourquoi acheter chez nous)
   - Saisonnalite (ventes stables ou pics)
3. **Fiches produit (structure):**
   - Nom commercial (pas le nom technique)
   - Benefice principal en 1 ligne
   - 3-5 arguments de vente
   - Variantes (tailles, couleurs, options)
   - FAQ produit (3-5 questions courantes)

### Livrable
`{projet}/_focus-output/ecommerce/fiches-produit.md`

### GATE 1 — Produit valide
- [ ] Catalogue complet avec prix et marges
- [ ] Concurrence analysee (au moins 5 concurrents)
- [ ] Differentiation claire
- [ ] Marge suffisante apres ads + livraison (minimum 30%)
- [ ] Produit valide

---

## ETAPE 2 — Positionnement

**Pourquoi cette etape:** "On vend des gummies" n'est pas un positionnement. "Les seuls gummies bio francais avec 7 vitamines pour les 25-35 ans actifs" en est un. Le positionnement decide de tout le reste: les prix, les visuels, les mots, les couleurs. Sans lui, la boutique n'a pas d'ame.

**Agent:** ghost (strategie), tasha (formulation)
**Skills a charger:** `copywriting` (formulation)
**Duree:** 20-30 min

### Ce qu'on fait
1. **Cible precise:**
   - Persona: age, genre, style de vie, budget, ou il/elle traine en ligne
   - Probleme: quel probleme le produit resout (en mots de la cible, pas en jargon)
   - Moment d'achat: quand et pourquoi la personne decide d'acheter
2. **Statement de positionnement:**
   - "Pour [cible], [marque] est le [categorie] qui [benefice unique] parce que [raison]"
3. **Pricing strategy:**
   - Premium / Mid-range / Agressif — avec justification
   - Comparaison avec la concurrence
   - Offres (bundle, abo, 2+1 gratuit, etc.)
4. **Promesse de marque:** La phrase que les clients retiennent

### Livrable
`{projet}/_focus-output/ecommerce/positionnement.md`

### GATE 2 — Positionnement clair
- [ ] Persona defini avec precision
- [ ] Statement en 2 phrases
- [ ] Pricing justifie par le marche
- [ ] Promesse de marque memorable
- [ ] Positionnement valide

---

## ETAPE 3 — Shop setup (Shopify)

**Pourquoi cette etape:** L'infrastructure technique de la boutique. Tout ce qui est "sous le capot" — theme, paiement, livraison, legal. Si le checkout bugge ou que la livraison n'est pas claire, personne n'achete. Cette etape est TECHNIQUE mais CRITIQUE.

**Agent:** tate (backend/infra), dre (frontend si theme custom)
**Duree:** 1-3h

### Ce qu'on fait
1. **Theme:**
   - Choisir un theme Shopify adapte (gratuit Dawn ou premium)
   - Customiser les couleurs, typo, logo selon le design system
   - Configurer la homepage, collection pages, product pages
2. **Paiement:**
   - Shopify Payments (CB) + PayPal
   - Apple Pay / Google Pay (si pertinent)
   - Stripe si besoin custom
3. **Livraison:**
   - Zones de livraison (local, national, international)
   - Tarifs par zone et par poids
   - Livraison gratuite a partir de X euros (seuil strategique)
   - Suivi colis
4. **Legal:**
   - CGV (Conditions Generales de Vente)
   - Mentions legales
   - Politique de retour/remboursement
   - Politique de confidentialite (RGPD)
   - Banniere cookies
5. **Pages essentielles:**
   - A propos
   - Contact
   - FAQ globale
   - Politique de livraison
6. **Email transactionnels:**
   - Confirmation de commande
   - Expedition
   - Bienvenue (si inscription newsletter)

### Livrable
Boutique Shopify configuree (URL de preview)

### GATE 3 — Shop fonctionnel
- [ ] Theme en place avec branding correct
- [ ] Paiement teste (commande test de bout en bout)
- [ ] Livraison configuree avec tarifs
- [ ] Pages legales presentes
- [ ] Emails transactionnels customises
- [ ] Checkout fonctionnel sur mobile

---

## ETAPE 4 — Copy produit

**Pourquoi cette etape:** Sur un e-commerce, le client ne peut pas toucher le produit. Il decide d'acheter uniquement a partir de ce qu'il LIT et de ce qu'il VOIT. La copy c'est ton vendeur — si elle est plate ou generique, le client part chez le concurrent.

**Agent:** tasha (copy principale)
**Skills a charger:** `copywriting` (frameworks AIDA/PAS/BAB)
**Duree:** 30-60 min

### Ce qu'on fait
1. **Titre produit:**
   - Clair, descriptif, avec le benefice principal
   - Pas de jargon technique (sauf si la cible est technique)
   - SEO-friendly (mot-cle principal inclus)
2. **Description courte (above the fold):**
   - 2-3 lignes max
   - Le benefice PRINCIPAL, pas les features
   - Urgence ou rarete si pertinent
3. **Description longue:**
   - Framework AIDA ou PAS selon le produit
   - Benefices > Features (ce que ca FAIT pour le client, pas ce que c'est)
   - Bullet points scannable (pas de mur de texte)
   - Social proof integre (avis, chiffres, certifications)
   - FAQ produit qui repond aux objections
4. **CTA:**
   - "Ajouter au panier" c'est OK, mais tester des alternatives
   - Urgence: stock limite, offre temporaire (si vrai, pas de faux)
5. **Meta tags:**
   - Title SEO (60 chars max)
   - Meta description (155 chars max)
   - Alt text sur toutes les images

### Livrable
Textes integres dans les fiches produit Shopify

### GATE 4 — Copy validee
- [ ] Chaque produit a un titre + description courte + description longue
- [ ] Benefices mis en avant (pas juste les features)
- [ ] FAQ produit repond aux 3-5 objections principales
- [ ] SEO meta tags sur chaque fiche
- [ ] Ton coherent avec le positionnement
- [ ] Copy validee

---

## ETAPE 5 — Photos / Visuels

**Pourquoi cette etape:** Sur internet, on achete avec les yeux. Des photos amateurs = un produit qui fait amateur. Meme un bon produit se vend mal avec de mauvaises images. Les visuels doivent donner envie ET informer.

**Agent:** tommy (direction artistique), dre (integration)
**Duree:** Variable (1h si images existantes, plus si shooting necessaire)

### Ce qu'on fait
1. **Photos produit:**
   - Fond blanc (packshot classique) — obligatoire pour la confiance
   - In-situ / lifestyle (produit en utilisation) — pour l'emotion
   - Detail / zoom (texture, etiquette, ingredients) — pour l'information
   - Echelle (produit dans la main, a cote d'un objet connu) — pour la taille
   - Minimum 4-6 photos par produit
2. **Format:**
   - Carre (1:1) pour les collections
   - 4:5 pour les fiches produit
   - WebP pour la performance
   - Taille: 1200x1200 minimum
3. **Visuels marketing:**
   - Bannieres homepage
   - Images pour les ads (voir etape 6)
   - Social media assets (Instagram, Facebook)
4. **Optimisation:**
   - Compression sans perte visible
   - Alt text descriptif sur chaque image
   - Lazy loading sur les pages collections

### Livrable
Images integrees dans la boutique Shopify + dossier source

### GATE 5 — Visuels prets
- [ ] Minimum 4 photos par produit
- [ ] Mix packshot + lifestyle + detail
- [ ] Format et taille corrects
- [ ] Images optimisees (poids < 200KB par image en WebP)
- [ ] Bannieres homepage en place
- [ ] Direction visuelle validee

---

## ETAPE 6 — Ads setup

**Pourquoi cette etape:** Un e-commerce sans trafic, c'est une boutique dans le desert. Les ads amenent des visiteurs qualifies — des gens qui ont deja envie d'acheter ce type de produit. Mais des ads mal configurees brulent du budget sans resultats.

**Agent:** ghost (strategie), tasha (copy ads)
**Skills a charger:** `copywriting` (hooks, CTA)
**Duree:** 1-2h

### Ce qu'on fait
1. **Meta Ads (Facebook + Instagram):**
   - Pixel installe et verifie
   - Evenements configures (ViewContent, AddToCart, Purchase)
   - 3-5 audiences:
     - Interets (base sur le persona)
     - Lookalike (si base clients existante)
     - Retargeting (visiteurs site)
   - 3-5 creatives par audience:
     - Image statique (packshot + texte)
     - Carrousel (multi-produit)
     - Video courte (15-30s)
   - Copy ads: hook + benefice + CTA
   - Budget test: 10-20 euros/jour/audience pendant 3-5 jours
2. **Google Ads (optionnel en phase 1):**
   - Google Shopping (feed produit)
   - Search (mots-cles acheteurs)
   - Performance Max (si catalogue large)
3. **Tracking:**
   - UTM sur chaque lien
   - Tableau de suivi quotidien (depenses, clics, conversions, ROAS)
4. **Creatives:**
   - Format 1:1 (feed Facebook/Instagram)
   - Format 9:16 (stories/reels)
   - Format 4:5 (feed optimal)

### Livrable
`{projet}/_focus-output/ecommerce/ads-setup.md` + campagnes configurees

### GATE 6 — Ads pretes a lancer
- [ ] Pixel Meta installe et verifie
- [ ] Au moins 3 audiences configurees
- [ ] Au moins 3 creatives par audience
- [ ] Budget test defini et approuve
- [ ] Tracking UTM en place
- [ ] Creatives et budget valides

---

## ETAPE 7 — Launch

**Pourquoi cette etape:** Le lancement c'est le moment ou tout converge — la boutique est prete, les ads sont configurees, les produits sont en stock. C'est aussi le moment le plus risque: si quelque chose bugge au lancement, les premiers visiteurs (les plus importants) auront une mauvaise experience.

**Agent:** ghost (coordination), tate (technique)
**Duree:** 30 min de verification + activation ads

### Ce qu'on fait
1. **Pre-launch checklist:**
   - [ ] Commande test passee de bout en bout (paiement → confirmation → email)
   - [ ] Livraison correctement calculee
   - [ ] Toutes les pages chargent sur mobile
   - [ ] Stock correct dans Shopify
   - [ ] Domaine pointe vers la boutique
   - [ ] HTTPS actif
   - [ ] CGV / mentions legales presentes
   - [ ] Email transactionnels testes
   - [ ] Pixel de tracking verifie
2. **Activation:**
   - Retirer la protection par mot de passe Shopify
   - Lancer les premieres campagnes ads
   - Poster sur les reseaux sociaux
   - Email a la base existante (si applicable)
3. **Monitoring J0:**
   - Surveiller les premieres commandes
   - Verifier que les emails partent
   - Checker le tracking ads

### Livrable
Boutique live + ads actives

### GATE 7 — Boutique live
- [ ] Boutique accessible publiquement
- [ ] Premiere commande passee (vraie ou test)
- [ ] Ads lancees et diffusees
- [ ] Tracking fonctionne (commande visible dans le pixel)
- [ ] Achat test complet fait

---

## ETAPE 8 — Optimisation

**Pourquoi cette etape:** Le lancement c'est le DEBUT, pas la fin. Les donnees des premiers jours montrent ce qui marche et ce qui ne marche pas. L'optimisation continue c'est ce qui transforme une boutique mediocre en machine a ventes.

**Agent:** ghost (analyse), storm (benchmarks)
**Skills a charger:** `vision360` (analyse donnees)
**Duree:** Continue (revue hebdomadaire)

### Ce qu'on fait
1. **Semaine 1-2: Collecte de donnees**
   - Trafic par source
   - Taux de conversion par page
   - Taux d'abandon panier
   - CPA (cout par acquisition) et ROAS
   - Produits les plus/moins consultes
2. **Semaine 3-4: Premiers ajustements**
   - Couper les ads qui ne performent pas
   - Doubler le budget sur ce qui marche
   - Ajuster les prix si necessaire
   - Ameliorer les fiches produit (base sur les donnees)
3. **Mensuel: Revue complete**
   - CA vs objectif
   - Marge nette (apres ads + livraison + produit)
   - Meilleur canal d'acquisition
   - Produit star vs flop
   - Actions pour le mois suivant
4. **Optimisation continue:**
   - A/B test sur les ads (creatives, audiences)
   - A/B test sur les fiches produit (titres, images)
   - Email marketing (panier abandonne, upsell, fidelisation)
   - SEO (blog, backlinks)

### Livrable
`{projet}/_focus-output/ecommerce/optimisation-report.md` (hebdo puis mensuel)

### Gate finale — E-commerce rentable
- [ ] Boutique live depuis 30+ jours
- [ ] Donnees suffisantes pour optimiser (100+ visiteurs minimum)
- [ ] ROAS positif (ou plan pour y arriver)
- [ ] Process d'optimisation en place (revue hebdomadaire)

---

## Quick Flow (version rapide)

Pour un lancement rapide en 3-5 jours.

```
QUICK-PRODUIT (30 min) → QUICK-SHOP (2h) → QUICK-COPY (1h) → QUICK-ADS (1h) → LAUNCH (30 min)
```

### Quick-Produit
- 1-3 produits max
- Fiche rapide: nom + prix + 3 benefices + 3 photos

### Quick-Shop
- Theme Shopify gratuit (Dawn)
- Configuration minimale: paiement + livraison + 1 page legale
- 1 collection, pas de fioritures

### Quick-Copy
- Titre + description courte + 5 bullet points par produit
- Homepage: headline + CTA + 3 features

### Quick-Ads
- 1 audience Meta (interets)
- 3 creatives (1 image, 1 carrousel, 1 video si possible)
- Budget: 15 euros/jour pendant 5 jours

### Launch
- Retirer le mot de passe
- Lancer les ads
- Surveiller pendant 24h

---

## Mapping Agents

| Etape | Agent principal | Agents support | Pourquoi cet agent |
|-------|----------------|----------------|---------------------|
| 1 Produit | ghost | storm | ghost = strategie produit, storm = recherche marche |
| 2 Positionnement | ghost | tasha | ghost = placement, tasha = formulation |
| 3 Shop setup | tate | dre | tate = infra/config, dre = theme custom |
| 4 Copy | tasha | ghost | tasha = copy vente, ghost = validation |
| 5 Visuels | tommy | dre | tommy = DA, dre = integration |
| 6 Ads | ghost | tasha | ghost = strategie, tasha = copy ads |
| 7 Launch | ghost | tate | ghost = coordination, tate = technique |
| 8 Optimisation | ghost | storm | ghost = analyse, storm = benchmarks |

---

## Dossier de sortie

```
{projet}/
└── _focus-output/
    └── ecommerce/
        ├── fiches-produit.md
        ├── positionnement.md
        ├── ads-setup.md
        └── optimisation-report.md
```
