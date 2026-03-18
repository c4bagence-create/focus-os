---
name: seo-underground
description: SEO technique 2026 — audit, keywords, backlinks, parasite SEO, schema markup, outreach, content strategy. Reference absolue pour tout projet qui vise la page 1 Google.
triggers:
  - "SEO"
  - "backlinks"
  - "classement Google"
  - "audit SEO"
  - "mots-cles"
---

# SKILL: SEO Underground 2026

> Reference absolue pour audit SEO, keywords, backlinks, parasite SEO, schema markup, outreach, content strategy.
> Derniere MaJ: mars 2026

---

## 1. GOOGLE ALGO 2024-2026

### Timeline des mises a jour majeures

**MARS 2024 — Core Update + Triple Spam Policy (45 jours)**
- Ciblage: contenu IA bas de gamme, backlinks manipulatifs, contenu non-original
- 3 nouvelles politiques spam:
  1. **Expired Domain Abuse**: domaines expires rachetes pour du contenu parasite -> desindexation
  2. **Scaled Content Abuse**: pages generees en masse -> penalite
  3. **Site Reputation Abuse**: contenu tiers sans supervision editoriale -> penalite
- Impact declare: -40% de contenu faible qualite dans les SERP
- Victimes notables: Forbes Advisor, CNN Underscored, WSJ Buy Side

**MAI 2024 — Site Reputation Abuse (enforcement)**
- Manual actions sur sites hebergeant contenu tiers non supervise
- Patterns penalises: /coupon/, /code-promo/, /advisor/, /buyside/ avec fournisseurs externes

**AOUT 2024 — Core Update (19 jours)**
- Ciblage: profondeur contenu, engagement utilisateur, pertinence
- Recompense: articles bien recherches, donnees originales, expertise demontree

**NOVEMBRE 2024 — Core Update + renforcement Site Reputation**
- Renforcement des regles May 2024, rollout 3 semaines

**FEVRIER 2025 — Discover Core Update**
- Outils anti-spam avances, raffinement E-E-A-T dans Google Discover

**MARS 2025 — Core Update (18+ jours)**
- 15% du Top 10 repositionne
- Forte volatilite niches finance/voyage/affiliation

**AOUT 2025 — Spam Update**
- Detection spam 2e generation: schemas comportementaux

**DECEMBRE 2025 — Core Update**
- Derniere mise a jour majeure connue, continuum qualite vs quantite

### Ce que Google recompense EN 2026 vs 2024

| Signal | 2024 | 2026 |
|--------|------|------|
| E-E-A-T | Important | CRITIQUE — Experience reelle obligatoire |
| Contenu IA | Tolere si utile | Detecte et devalue si generique |
| Parasite SEO | Risque | Penalite manuelle garantie si spam |
| Backlinks achetes | Risque | Algorithmiquement neutralises |
| Helpful Content | Systeme separe | Integre dans Core Ranking |
| AI Overviews | Emergent | Dominant — Featured Snippets -35% |
| Schema / Structured data | Bonus | Requis pour visibilite SGE / AI Overviews |

### Regles operationnelles
- JAMAIS heberger du contenu tiers sans supervision editoriale complete
- JAMAIS generer des pages en masse sans valeur differenciee
- TOUJOURS citer des sources, experiences reelles, donnees originales
- Contenu IA = acceptable UNIQUEMENT si revu, enrichi, personnalise par l'auteur

---

## 2. ARSENAL OUTILS

### SEMrush MCP — 19 outils disponibles

**Domain Analytics**

| Outil | Usage | Params |
|-------|-------|--------|
| `semrush_domain_overview` | Vue d'ensemble domaine (trafic, autorite, tendance) | domain, database? |
| `semrush_domain_organic_keywords` | Keywords organiques positionnes | domain, database?, limit? |
| `semrush_domain_paid_keywords` | Keywords payants / campagnes SEM | domain, database?, limit? |
| `semrush_competitors` | Concurrents organiques directs | domain, database?, limit? |

**Backlinks**

| Outil | Usage | Params |
|-------|-------|--------|
| `semrush_backlinks` | Liste complete backlinks d'un domaine/URL | target, limit? |
| `semrush_backlinks_domains` | Domaines referents uniquement | target, limit? |

**Keyword Analytics**

| Outil | Usage | Params |
|-------|-------|--------|
| `semrush_keyword_overview` | Vue d'ensemble keyword (volume, KD, CPC, intent) | keyword, database? |
| `semrush_keyword_overview_single_db` | Detail par database specifique | keyword, database |
| `semrush_batch_keyword_overview` | Batch jusqu'a 100 keywords d'un coup | keywords, database |
| `semrush_related_keywords` | Keywords lies / variantes semantiques | keyword, database?, limit? |
| `semrush_keyword_organic_results` | Qui rank sur ce keyword (positions 1-20) | keyword, database, limit? |
| `semrush_keyword_paid_results` | Qui bide sur ce keyword | keyword, database, limit? |
| `semrush_keyword_ads_history` | Historique 12 mois des encheres | keyword, database, limit? |
| `semrush_broad_match_keywords` | Broad match + variantes longue traine | keyword, database, limit? |
| `semrush_phrase_questions` | Questions People Also Ask associees | keyword, database, limit? |
| `semrush_keyword_difficulty` | Difficulte top 10 (batch) | keywords, database |

**Traffic**

| Outil | Usage | Params |
|-------|-------|--------|
| `semrush_traffic_summary` | Trafic estime multi-domaines (comparatif) | domains, country? |
| `semrush_traffic_sources` | Sources de trafic (organic/paid/social/direct) | domain, country? |
| `semrush_api_units_balance` | Credits restants (TOUJOURS checker avant grosse analyse) | check: true |

**IMPORTANT**: Toujours verifier `semrush_api_units_balance` avant une grosse session.

### 25+ outils gratuits par categorie

**Backlink Analysis**

| Outil | URL | Limite gratuite | Usage |
|-------|-----|----------------|-------|
| Ahrefs Webmaster Tools | ahrefs.com/webmaster-tools | Illimite (site verifie) | Backlinks propre site |
| Ahrefs Free Tools | ahrefs.com/free-seo-tools | Limite quotidienne | Backlink checker, keyword gen, SERP |
| Moz Link Explorer | moz.com/link-explorer | 10 queries/mois | DA/PA, spam score |
| Majestic | majestic.com | 3 domains/jour | Trust Flow / Citation Flow |
| OpenLinkProfiler | openlinkprofiler.org | Illimite | Backlinks 100% gratuit |
| Ubersuggest | neilpatel.com/ubersuggest | 3 recherches/jour | Backlinks + keywords |
| BacklinkWatch | backlinkwatch.com | Illimite | Checker rapide |

**Keyword Research**

| Outil | URL | Limite gratuite | Usage |
|-------|-----|----------------|-------|
| Google Search Console | search.google.com/search-console | Illimite | Keywords reels + CTR + impressions |
| Google Keyword Planner | ads.google.com | Illimite (compte gratuit) | Volume + CPC reel |
| Bing Webmaster Tools | bing.com/webmasters | Illimite | Audit + keyword research unique |
| AnswerThePublic | answerthepublic.com | 3 recherches/jour | Questions longue traine |
| AlsoAsked | alsoasked.com | 3 recherches/jour | People Also Ask mapping |
| Google Trends | trends.google.fr | Illimite | Tendances temporelles, saisonnalite |
| Keyword Surfer | keywordsurfer.com | Extension Chrome gratuite | Volumes inline dans les SERP |
| Keywords Everywhere | keywordseverywhere.com | Extension Chrome | Volumes partout |

**Technical SEO**

| Outil | URL | Limite gratuite | Usage |
|-------|-----|----------------|-------|
| Google PageSpeed Insights | pagespeed.web.dev | Illimite | Core Web Vitals (LCP, INP, CLS) |
| Screaming Frog | screamingfrog.co.uk | 500 URLs free | Crawl technique complet |
| Seobility | seobility.net | 1 projet free | Audit on-page + technique |
| GTmetrix | gtmetrix.com | 3 tests/mois | CWV detaille |
| Schema Validator | validator.schema.org | Illimite | Valider JSON-LD |
| Rich Results Test | search.google.com/test/rich-results | Illimite | Tester rich snippets |
| SERP Simulator | mangools.com/free-seo-tools/serp-simulator | Illimite | Preview snippet Google |

**Competitor & SERP**

| Outil | URL | Limite gratuite | Usage |
|-------|-----|----------------|-------|
| SimilarWeb | similarweb.com | 5 resultats/metric | Trafic estime concurrent |
| SpyFu | spyfu.com | 3 recherches/jour | Keywords payants concurrents |
| BuiltWith | builtwith.com | Illimite | Stack technique concurrent |
| SERPChecker | whatsmyserp.com | Illimite | Tracker rankings gratuit |

**Expired Domains**

| Outil | URL | Limite gratuite | Usage |
|-------|-----|----------------|-------|
| ExpiredDomains.net | expireddomains.net | Gratuit | Filtre par TLD/DA/backlinks |
| DomCop | domcop.com | Freemium (10M+ domaines) | Metriques combinees Moz+Majestic+SEMrush |
| Spamzilla | spamzilla.io | Freemium | Detecte spam history, filtres custom |
| Wayback Machine | web.archive.org | Gratuit | Historique contenu domaine |
| Domain Hunter Gatherer | — | Freemium | Web crawling + donnees Majestic |

**Outreach Journalistes (HARO & alternatives)**

| Plateforme | URL | Status 2026 | Cout | Taux succes |
|-----------|-----|------------|------|------------|
| Featured.com (ex-HARO) | featured.com | ACTIF | Gratuit | 42% |
| Qwoted | qwoted.com | ACTIF | Freemium | Modere |
| SourceBottle | sourcebottle.com | ACTIF | Gratuit | Modere |
| PressPlugs | pressplugs.com | ACTIF | Freemium | UK focused |
| JournoRequest | Twitter #journorequest | ACTIF | Gratuit | UK/FR |
| ResponseSource | responsesource.com | ACTIF | Payant | Pro, qualite premium |
| Help a B2B Writer | helpab2bwriter.com | ACTIF | Gratuit | Niche B2B |

---

## 3. TECHNIQUES PAR TIER

### TIER S — White Hat Premium (TOUJOURS faire)

**1. Content Depth (2500+ mots)**
- Chaque article principal = 2500+ mots, donnees reelles, FAQ, sources citees
- E-E-A-T: experience personnelle demontree
- Images originales, captures d'ecran, tableaux comparatifs
- Mise a jour reguliere (dateModified dans schema)
- **Workflow**: keyword research -> outline -> redaction -> optimisation on-page -> publication -> link building interne

**2. Internal Linking Silo**
- Architecture en silos thematiques coherente avec la niche
- Chaque article = 5-10 liens internes vers articles du meme silo
- Pages piliers -> sous-pages detaillees
- Ancres variees: exact match (30%), partiel (40%), brand (30%)
- **Workflow**: mapper tous les articles -> identifier les orphelins -> ajouter liens -> verifier avec Screaming Frog

**3. Google Search Console Optimization**
- Analyser CTR par query -> titres <5% CTR = reecrire meta title
- Positions 4-10 = quick wins -> optimiser contenu + liens internes
- Cannibalisation: deux pages sur le meme keyword -> fusionner ou differencier intent
- **Workflow**: export GSC -> trier par impressions decroissantes -> identifier sous-performers -> action

**4. Schema JSON-LD Complet**
- Chaque page = schema approprie (voir Section 7)
- Valider sur validator.schema.org AVANT deploiement
- Types critiques: Review, FAQPage, HowTo, Article, BreadcrumbList, Organization
- **Workflow**: identifier le type de page -> copier template -> adapter donnees -> valider -> deployer

**5. Core Web Vitals**
- LCP < 2s, INP < 200ms, CLS < 0.05
- Next.js Image optimization, font preload, lazy loading
- Tester sur PageSpeed Insights ET GTmetrix
- **Workflow**: tester -> identifier bottleneck -> fix -> re-tester -> monitorer

### TIER A — Grey Hat Intelligent (Risque faible, ROI eleve)

**1. HARO / Featured.com — Backlinks DR60+ gratuits**
- S'inscrire sur featured.com (successeur HARO, anti-spam IA, 42% taux succes)
- 3 digests/jour: matin 5h, midi 12h30, soir 17h30
- REPONDRE DANS LES 2 HEURES — apres c'est ignore a 80%
- Repondre en 3 points max + citation utilisable entre guillemets
- Objectif: 3-5 liens/mois de sites media (DA 50-90)
- **Workflow**: alerte email -> lire query -> rediger reponse expert 150 mots -> envoyer < 2h -> tracker

**2. Parasite SEO — 14 plateformes documentees**

*Tier 1 — Haute autorite, indexation 24-72h:*

| Plateforme | DA/DR | Indexation | Notes |
|-----------|-------|------------|-------|
| LinkedIn Articles | DA 98 | 24-48h | Contenu expert, liens dans le corps |
| Medium | DA 94 | 24-72h | Guides longs, lien contextuel |
| Reddit FR | DA 91 | 48-72h | Aide genuine uniquement, JAMAIS spam |
| YouTube descriptions | DA 100 | 3-7j | Videos comparatifs + lien description |
| Pinterest | DA 94 | 3-5j | Infographies — forte re-indexation |
| GitHub | DA 96 | 72h | README.md guides techniques |
| Quora FR | DA 87 | 48-72h | Reponses expertes detaillees + lien contextuel |
| Substack | DA 91 | 3-7j | Newsletter indexee, communaute croissante |

*Tier 2 — Autorite moyenne, resultats plus lents:*

| Plateforme | DA/DR | Notes |
|-----------|-------|-------|
| Google Sites | DA 100 | Indexation lente mais DA maximal |
| Blogger | DA 88 | Liens dofollow, contenu original requis |
| WordPress.com | DA 93 | Gratuit, lien profil dofollow |
| Tumblr | DA 82 | En declin mais encore indexe |
| Notion (pages publiques) | DA 90 | Guides/tutoriels, format propre |
| Slideshare | DA 95 | Presentations PDF, liens dans slides |

*Tier 3 — Volume / brand mentions:*
- Issuu, Product Hunt, Crunchbase, G2, Capterra, Behance, Canva pages (DA 90+)
- Profile links + bio = signal brand mentions E-E-A-T

**ALERTE 2025-2026**: Google Site Reputation Abuse policy actif. Contenu genuinement utile OBLIGATOIRE.

**3. Web 2.0 Profiles — 20+ profils a creer**
- about.me, gravatar.com, crunchbase, WordPress.com, Blogger, Tumblr
- Chaque profil: nom coherent + bio identique + lien vers votre site
- Signal: coherence NAP (Name, Address, Phone) + brand mentions
- **Workflow**: creer 5 profils/semaine -> bio complete -> lien -> screenshot pour archive

**4. Guest Posts — Blogs de votre niche**
- Identifier blogs avec DA 30+ dans votre secteur
- Proposer article 1500 mots + 1 lien contextuel dofollow
- **Workflow**: lister 20 blogs cibles -> verifier DA -> rediger pitch personnalise -> envoyer -> relance J+7

**5. Broken Link Building**
- Ahrefs -> broken backlinks de vos concurrents principaux
- Identifier liens 404 qui pointaient vers du contenu similaire au votre
- Contacter le webmaster: "ton lien vers X est casse, j'ai un article similaire"
- Taux de reponse: 5-15% mais liens TRES qualifies (contextuels, dofollow)
- **Workflow**: Ahrefs "broken backlinks" concurrent -> filtrer DA 30+ -> verifier contenu 404 -> email (Template 2) -> envoyer 10/semaine

**6. ABC Link Exchange**
- Schema: Site A -> Site B -> Site C -> Site A
- Pas de lien reciproque direct -> invisible pour Google
- Trouver partenaires via groupes Facebook SEO FR, Discord, WebRankInfo
- Plateformes: LinkWhisper, Linksy
- **Workflow**: rejoindre 3 groupes SEO FR -> proposer echange triangulaire -> verifier DA -> implementer -> monitorer

### TIER B — Grey Hat Avance (Risque modere)

**1. Expired Domains — Workflow complet**

*Criteres obligatoires (5):*
- DR (Ahrefs) >= 20 OU TF (Majestic) >= 15
- Referring Domains >= 20 uniques
- Age >= 5 ans
- Spam Score (Moz) <= 10%
- Extension: TLD local EN PRIORITE, puis .com, .net

*Redhibitoires (5 red flags):*
- Ancien site casino/betting/adulte/pharma
- Penalite Google visible (chute soudaine trafic Ahrefs)
- Profil liens unilangue bizarre (ex: 90% ancres chinoises)
- Pas d'archive Wayback ou archive spam
- TF < CF (signal manipulation Majestic)

*Checklist verification penalite:*
1. `site:domaine.fr` dans Google -> moins de 5 pages = probleme
2. Ahrefs > Domain Overview -> graphe trafic historique (chute soudaine = penalite)
3. Google Transparency Report -> verifier si liste comme malveillant
4. Majestic > Backlink History -> profil naturel ou spikes artificiels ?
5. Wayback Machine -> valider contenu historique propre

*Strategies d'utilisation:*
- **Option A — 301 Redirect**: DR 25+ niche identique -> redirection 301 vers votre site (transfert juice 3-6 mois)
- **Option B — Rebuild**: reconstruire le site original avec contenu ameliore + liens internes vers votre site
- **Option C — PBN**: reseau prive (risque eleve)

*Budget:*
- DR 20-30: 50-200$ (GoDaddy Auctions)
- DR 30-50: 200-1000$
- DR 50+: 1000-5000$
- Hebergement: 5$/mois/site

**2. PBN Light — Mini reseau 3-5 sites**
- 3-5 mini-sites sur des sous-niches de votre domaine
- Heberges sur IPs DIFFERENTES (Hostinger, OVH, Ionos)
- 5-10 articles chacun + liens vers votre site principal
- Templates DIFFERENTS, contenus UNIQUES, pas de crosslinking entre PBN
- RISQUE: detection Google si meme template, meme contenu, meme whois
- **Workflow**: acheter 3 domaines expires -> heberger separement -> installer WP themes differents -> 5 articles/site -> lien contextuel 1x/article

**3. Tiered Link Building T1->T2->T3**
```
[VOTRE-SITE.FR]
     ^ liens directs haute qualite
[TIER 1] Guest posts niche, HARO editoriaux, niche inserts
     ^ liens amplifiant les T1
[TIER 2] Web 2.0 (WordPress.com, Blogger), Medium, LinkedIn, parasites
     ^ liens en volume vers T2
[TIER 3] Social bookmarks, profile links, commentaires, annuaires low-DA
```
- T1 = qualite maximale, liens VERS ton site UNIQUEMENT
- T2 = liens VERS tes T1 uniquement (JAMAIS direct vers ton site)
- T3 = volume/auto, JAMAIS pointer vers ton site directement
- Ratio naturel: 1 T1 : 5 T2 : 20 T3
- Outils T3 acceptables: GSA SER, RankerX (uniquement T3)

**4. Niche Edits — Liens dans articles existants**
- Trouver articles de votre niche bien positionnes (top 20 sur tes keywords)
- Proposer paiement (50-200EUR) pour ajout lien contextuel dans article existant
- Plus naturel qu'un guest post: article ancien, deja indexe, historique Google
- **Workflow**: identifier 20 articles ranktes -> contacter webmaster -> negocier prix -> fournir ancre + URL -> verifier

**5. YouTube SEO Hacking**
- Creer chaine thematique alignee avec votre niche
- **Timestamps = Keywords** -> Google extrait clips pour Key Moments SERP
- **Description 500+ mots** -> transcript complet + keywords + liens vers votre site
- **Chapters avec keywords** -> nommes strategiquement pour chaque segment
- **Embeds sur ton site** -> signal engagement croise YouTube/site
- **Shorts** = format viral pour drive traffic rapide
- **Premiers commentaires** -> Q&R keyword-rich dans les premieres heures

### TIER C — Dark Hat (Risque eleve, Tier 3 UNIQUEMENT)

**1. Comment Spam Automatise**
- Outils: GSA SER, Scrapebox
- Forums, blogs, commentaires de masse
- UNIQUEMENT en Tier 3 (JAMAIS direct vers site principal)

**2. Link Farms**
- Reseaux de liens automatises
- Fiverr "1000 backlinks for $5" = DANGER en T1
- Acceptable UNIQUEMENT en T3 pour booster T2

**3. Doorway Pages**
- Pages satellite ultra-optimisees sur domaines jetables
- Risque penalite manuelle Google
- UNIQUEMENT sur domaines jetables, JAMAIS sur votre site principal

**REGLE ABSOLUE**: Les techniques Tier C ne doivent JAMAIS pointer directement vers votre site principal. Toujours via Tier 2 minimum.

---

## 4. SEO LOCAL / NATIONAL

### Annuaires FR — Table complete par DA

**Tier 1 — Indispensables (DA 60+)**

| Annuaire | URL | DA | Type | Action |
|----------|-----|-----|------|--------|
| Google Business Profile | business.google.com | 100 | Local | Creer fiche complete |
| TripAdvisor | tripadvisor.fr | 93 | Tourisme | Profil expert + reponses |
| Trustpilot | fr.trustpilot.com | 90+ | Reviews | Page entreprise |
| PagesJaunes / SoLocal | pagesjaunes.fr | 84 | Local/Business | Creer fiche |
| Gralon | gralon.net | 84 | General | Soumettre site |
| Kompass | fr.kompass.com | 75+ | B2B | Inscription gratuite |
| Mappy | mappy.com | 70+ | Local/Maps | Fiche locale |
| Yelp | yelp.fr | 69 | Local/Reviews | Creer fiche |
| Societe.com | societe.com | 78 | Entreprise | Verifier presence |

**Tier 2 — Valeur secondaire (DA 40-60)**

| Annuaire | URL | DA | Type |
|----------|-----|-----|------|
| WebRankInfo | webrankinfo.com | 62 | SEO/Web |
| Verif.com | verif.com | 60+ | B2B/Legal |
| Infobel | infobel.com/fr | 65+ | International |
| Annuaire.com | annuaire.com | 55 | Generaliste |
| Pappers.fr | pappers.fr | 55+ | B2B/SIRET |
| WebWiki | webwiki.fr | 55+ | General |
| Starofservice | starofservice.com | 55+ | Services |
| 118000.fr | 118000.fr | 52 | Local |
| Bing Places | bingplaces.com | 51 | Local |
| MeilleurDuWeb | meilleurduweb.com | 50+ | General web |
| Cylex | cylex-locale.fr | 50+ | Local |
| Hoodspot | hoodspot.fr | 45+ | Local |
| HotFrog | hotfrog.fr | 44 | Local |
| Indexa | indexa.fr | 43 | General |
| Europages | europages.fr | 41 | B2B |
| Yalwa | yalwa.fr | 36 | Local |

**Strategie**: 5-10 annuaires/semaine max. Profil complet (description, logo, URL, categories). Pas de spam masse.

### Google.fr — Specificites 2026

1. **Langue**: requetes francaises -> resultats francais en priorite
2. **Backlinks .fr**: liens depuis domaines .fr = poids SUPERIEUR sur SERP FR
3. **hreflang**: obligatoire pour Next.js — `<html lang="fr">` + `<link rel="alternate" hrefLang="fr-FR" />`
4. **AI Overviews**: -35% featured snippets en France depuis mars 2025 -> schema markup CRITIQUE
5. **PAA ("Autres questions posees")**: plus present que les featured snippets -> OPTIMISER les FAQ
6. **Local Pack**: Google.fr affiche le pack local pour requetes geolocalisees -> adresse francaise utile
7. **E-E-A-T**: CRITIQUE en YMYL (finance/sante/droit) — page "Qui sommes-nous" + auteur avec credentials
8. **Google Discover**: images-first + titres engageants. Mesurer CTR pour optimiser

### Patterns de contenu qui rankent
- "Meilleur [produit] [annee]" -> intent transactionnel fort
- "Avis [produit/service] [annee]" -> review intent eleve
- "[Produit]: le guide complet" -> evergreen, attire liens naturels
- "Est-ce que [X] est legit/serieux ?" -> confiance + conversion
- "Comparatif [A] vs [B]" -> decision stage
- FAQ avec Schema -> eligible position 0 et PAA

---

## 5. TEMPLATES OUTREACH FR

### Template 1 — Guest Post (email froid)

**Objet:** Proposition article invite — [Titre accrocheur lie a leur niche]

```
Bonjour [Prenom],

J'ai lu ton article sur [article specifique qu'ils ont publie] — tres bonne analyse sur [point precis].

Je tiens [votre-site.fr], un site specialise dans [votre niche]. J'ecris a des lecteurs qui veulent [benefice principal].

Je voudrais te proposer un article invite sur:
"[Titre d'article en lien avec LEUR audience et TA niche]"

Ce que j'apporte:
- Donnees exclusives: [exemple concret]
- Format: [X] mots, optimise SEO, avec exemples reels
- Exclusivite: contenu inedit, pas publie ailleurs

Tu peux voir mes articles recents ici: [votre-site.fr]/blog

Interesse(e) ?

[Prenom]
[votre-site.fr]
```

### Template 2 — Broken Link Building

**Objet:** Lien casse trouve sur [URL de leur page]

```
Bonjour [Prenom],

En lisant ton article [URL], j'ai remarque que le lien vers [URL cassee] ne fonctionne plus (erreur 404).

J'ai justement un article complet sur ce sujet: [URL de ton article]
-> [Titre + 1 phrase de description valeur]

Si ca correspond a ce que tu voulais pointer, n'hesite pas a remplacer l'ancien lien par le mien.

Merci et bonne continuation,
[Prenom]
[votre-site.fr]
```

### Template 3 — Resource Page Outreach

**Objet:** Ressource pour completer ta page [Titre de leur page ressource]

```
Bonjour [Prenom],

Ta page de ressources sur [theme] est excellente — particulierement la section [point precis].

J'ai cree [description de ton contenu] qui pourrait completer ta liste:
-> [URL] — [1 phrase valeur unique]

[2 chiffres/stats qui prouvent la valeur du contenu]

Si ca interesse tes lecteurs, je serais ravi que tu l'inclues.

[Prenom]
[votre-site.fr]
```

### Template 4 — Skyscraper Technique

**Objet:** Version amelioree de [leur article]

```
Bonjour [Prenom],

J'ai trouve ton article "[Titre leur article]" en recherchant sur [sujet].

J'ai cree une version mise a jour avec:
- [X nouvelles donnees 2026]
- [Outil/calculateur interactif ajoute]
- [Section manquante dans leur version]

Article: [URL]

Vu que tu as deja traite ce sujet, tu pourrais vouloir lier vers cette version plus complete — ou la mentionner a tes lecteurs.

[Prenom]
[votre-site.fr]
```

### Template 5 — Link Exchange Proposal (subtil)

**Objet:** Collaboration contenu — [Sujet commun]

```
Bonjour [Prenom],

Je suis [Prenom] de [votre-site.fr] — on couvre tous les deux [niche commune].

J'ai un article sur [Sujet A] qui lie naturellement vers des ressources sur [Sujet B, leur niche].
Tu as surement un article sur [Sujet B] qui pourrait mentionner [Sujet A].

Ca te serait utile si on s'echangeait des liens contextuels sur ces deux sujets ?

Les deux articles: [tes URLs] — [leurs URLs]

Pas de PBN ou schema artificiel — juste deux sites complementaires qui s'entraident.

[Prenom]
[votre-site.fr]
```

### Template 6 — Reponse HARO / Featured.com

**Version anglaise (HARO international):**
```
Subject: RE: [Query title] — [Your Expertise] Expert Response

Hi [Journalist name],

I'm [Prenom], founder of [votre-site.fr] and a specialist with X years of experience in [domaine].

Regarding your query on [sujet]:

[Point 1 — reponse directe avec chiffre/stat]
[Point 2 — exemple concret personnel]
[Point 3 — conseil actionnable unique]

Quick bio: [2 phrases sur votre expertise et votre site].

Happy to provide more details, quotes, or data.

Best,
[Prenom]
[votre-site.fr] | [email]
```

**Version courte (si query simple):**
```
[3 phrases max]
[Stat ou chiffre unique]
[Citation utilisable directement entre guillemets]

— [Prenom], [votre-site.fr]
```

---

## 6. CALENDRIER EDITORIAL

### Principes de timing

| Evenement | Timing publication | Frequence |
|-----------|-------------------|-----------|
| Contenus evergreen | N'importe quand | 2-4/mois |
| Actualites niche | Dans les 2h | Selon evenements |
| Articles guides | Mardi ou Mercredi matin | 1-2/semaine |
| Mise a jour anciens articles | Signal fraicheur | Tous les 6 mois |

### Framework TOFU-MOFU-BOFU

```
TOFU (Top of Funnel) — Informatif, volume eleve
-> "comment fonctionne X", "qu'est-ce que Y", tutoriels
-> Objectif: trafic + notoriete

MOFU (Middle of Funnel) — Comparatif, intent commercial
-> "meilleur X", "X vs Y", "alternatives a Z"
-> Objectif: consideration + lead

BOFU (Bottom of Funnel) — Transactionnel, intent achat
-> "prix X", "acheter Y", "[produit] avis"
-> Objectif: conversion
```

### Calendrier editorial efficace
- 1-2 articles TOFU par semaine (trafic de masse)
- 2-4 articles MOFU par mois (lead generation)
- 1 article BOFU par mois (conversion directe)
- Mise a jour des anciens articles tous les 6 mois (signal de fraicheur)

---

## 7. SCHEMA JSON-LD COMPLET

### Schema 1 — Article / BlogPosting
```json
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "[Titre de l'article]",
  "description": "[Description 150 chars]",
  "author": {
    "@type": "Person",
    "name": "[Auteur]",
    "url": "[votre-site.fr]/a-propos"
  },
  "publisher": {
    "@type": "Organization",
    "name": "[Nom du site]",
    "logo": {
      "@type": "ImageObject",
      "url": "[votre-site.fr]/logo.png"
    }
  },
  "datePublished": "2026-01-01",
  "dateModified": "2026-03-01",
  "image": "[votre-site.fr]/og/article.jpg",
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "[votre-site.fr]/blog/article"
  }
}
```

### Schema 2 — Review
```json
{
  "@context": "https://schema.org",
  "@type": "Review",
  "name": "[Produit] — Avis Complet 2026",
  "reviewBody": "[Corps de la review]",
  "reviewRating": {
    "@type": "Rating",
    "ratingValue": "4.5",
    "bestRating": "5",
    "worstRating": "1"
  },
  "author": {
    "@type": "Person",
    "name": "[Auteur]",
    "jobTitle": "[Expertise]"
  },
  "publisher": {
    "@type": "Organization",
    "name": "[Nom du site]",
    "url": "[votre-site.fr]"
  },
  "datePublished": "2026-01-01",
  "dateModified": "2026-03-01",
  "itemReviewed": {
    "@type": "Product",
    "name": "[Produit evalue]"
  }
}
```

### Schema 3 — FAQPage (ESSENTIEL — PAA et AI Overviews)
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "[Question 1 ?]",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "[Reponse complete et precise]"
      }
    },
    {
      "@type": "Question",
      "name": "[Question 2 ?]",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "[Reponse complete et precise]"
      }
    }
  ]
}
```

### Schema 4 — HowTo (guides pratiques)
```json
{
  "@context": "https://schema.org",
  "@type": "HowTo",
  "name": "[Comment faire X]",
  "description": "[Guide pas a pas pour Y]",
  "totalTime": "PT15M",
  "step": [
    {
      "@type": "HowToStep",
      "name": "[Etape 1]",
      "text": "[Instructions detaillees...]",
      "position": 1
    },
    {
      "@type": "HowToStep",
      "name": "[Etape 2]",
      "text": "[Instructions detaillees...]",
      "position": 2
    }
  ]
}
```

### Schema 5 — BreadcrumbList
```json
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    { "@type": "ListItem", "position": 1, "name": "Accueil", "item": "[votre-site.fr]" },
    { "@type": "ListItem", "position": 2, "name": "[Categorie]", "item": "[votre-site.fr]/categorie" },
    { "@type": "ListItem", "position": 3, "name": "[Page]", "item": "[votre-site.fr]/categorie/page" }
  ]
}
```

### Schema 6 — Organization (site-wide)
```json
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "[Nom du site]",
  "url": "[votre-site.fr]",
  "description": "[Description du site]",
  "foundingDate": "2026",
  "sameAs": ["[linkedin-url]", "[twitter-url]"],
  "contactPoint": {
    "@type": "ContactPoint",
    "contactType": "customer service",
    "email": "contact@[votre-site.fr]",
    "availableLanguage": "French"
  }
}
```

### Schema 7 — Product (comparatifs)
```json
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "[Produit]",
  "description": "[Description]",
  "brand": {
    "@type": "Brand",
    "name": "[Marque]"
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.7",
    "reviewCount": "89",
    "bestRating": "5"
  },
  "offers": {
    "@type": "Offer",
    "priceCurrency": "EUR",
    "price": "[prix]",
    "availability": "https://schema.org/InStock"
  }
}
```

### Implementation Next.js (pattern lib/seo.ts)
```typescript
// Generateur dynamique
export function generateReviewSchema(item: ItemData): string {
  return JSON.stringify({
    "@context": "https://schema.org",
    "@type": "Review",
    // ... donnees dynamiques
  })
}

// Dans le composant page
import { JsonLd } from '@/components/seo/JsonLd'
<JsonLd data={generateReviewSchema(item)} />
```

---

## 8. WORKFLOWS AGENTS

### Workflow 1 — Audit Concurrent Complet
```
ENTREE: nom de domaine concurrent
1. semrush_api_units_balance -> verifier credits
2. semrush_domain_overview(concurrent, "fr") -> snapshot global
3. semrush_domain_organic_keywords(concurrent, "fr", 100) -> top 100 keywords
4. semrush_competitors(concurrent, "fr") -> autres concurrents secondaires
5. semrush_backlinks_domains(concurrent, 50) -> sourcer les linking domains
SORTIE: tableau keywords a cibler + liste opportunites backlinks + scoring effort/impact
```

### Workflow 2 — Content Gap Analysis
```
ENTREE: mon domaine + 1-3 domaines concurrents
1. semrush_domain_organic_keywords(mon-site, "fr") -> mes keywords
2. semrush_domain_organic_keywords(concurrent1, "fr") -> keywords concurrent
3. DIFF = keywords concurrent NON couverts par moi -> content gap
4. semrush_keyword_difficulty(gap-keywords) -> confirmer KD
5. semrush_related_keywords(gap-keyword) -> cluster semantique
SORTIE: plan editorial priorise par volume/KD + intent
```

### Workflow 3 — Backlink Prospecting
```
ENTREE: domaine concurrent
1. semrush_backlinks_domains(concurrent, 100) -> qui linke vers concurrent
2. FILTRER: DA 30+ qui ne linkent PAS vers mon site
3. VERIFIER: niche fit + page contact accessible
4. CLASSIFIER: guest post possible / broken link / resource page / niche edit
SORTIE: liste 20 prospects avec URL + methode + template outreach a utiliser
```

### Workflow 4 — Keyword Opportunity Scan
```
ENTREE: mon domaine
1. semrush_domain_organic_keywords(mon-site, "fr") -> mes positions actuelles
2. FILTRER: positions 4-10 -> "near page 1" opportunities
3. semrush_keyword_difficulty(filtered-keywords) -> confirmer KD bas
4. Pour chaque KW: verifier si content depth suffit ou si boost necessaire
SORTIE: 20 pages a booster en priorite avec action specifique
```

---

## 9. CHECKLIST AUDIT SEO & FORMAT OUTPUT

### Checklist audit express (a chaque session)
1. **Backlink Profile**: `semrush_backlinks` + `semrush_backlinks_domains` -> profil actuel
2. **Keywords**: `semrush_domain_organic_keywords` database selon pays -> positions
3. **Concurrents**: `semrush_competitors` -> analyser top 5
4. **Content Gaps**: `semrush_related_keywords` sur nos keywords principaux
5. **Technical**: verifier sitemap, robots.txt, canonical, JSON-LD
6. **Opportunites**: `semrush_phrase_questions` pour trouver PAA a cibler

### Checklist on-page
- [ ] 1 mot-cle principal par page (pas de cannibalisme)
- [ ] H1 unique et contenant le mot-cle
- [ ] Meta title et description uniques sur chaque page
- [ ] Images avec alt text descriptif
- [ ] Liens internes vers les pages importantes (maillage)
- [ ] Pas de "thin content" (pages < 300 mots sans valeur ajoutee)
- [ ] Schema markup valide sur validator.schema.org

### Checklist technique
- [ ] HTTPS actif, pas de mixed content
- [ ] Sitemap XML soumis a Google Search Console
- [ ] Robots.txt correct (pas de blocage des pages importantes)
- [ ] Core Web Vitals dans le vert (LCP < 2.5s, INP < 200ms, CLS < 0.1)
- [ ] Pas de contenu duplique (canonical tags)
- [ ] Schema markup sur les pages cles

### Format output obligatoire
- **Tableaux > paragraphes** — toujours structurer en tableau quand possible
- **Chiffres > opinions** — DA, volume, KD, positions dans chaque recommandation
- **Action items numerotes** — pas de listes a puces sans numerotation
- **Scoring rubric** pour chaque recommandation:
  - **Effort**: Low / Medium / High
  - **Impact**: Low / Medium / High
  - **Risque**: Low / Medium / High
- **Sources citees** pour les claims importants

### Regles operationnelles
1. TOUJOURS verifier les donnees recentes avant d'affirmer un volume ou position
2. JAMAIS fabriquer des donnees — verifier sur les sources officielles
3. Chaque review = experience reelle (E-E-A-T) + comparatif chiffre
4. Tout schema JSON-LD = valider sur validator.schema.org AVANT deploiement
5. Outreach = 1 email personnalise > 100 emails generiques
6. Parasite SEO = uniquement contenu avec valeur reelle (pas de spam de liens)
7. Expired domains = verifier niche fit et historique propre AVANT achat
8. HARO/Featured.com = repondre dans les 2h du digest, citation directe utilisable

---

*Skill seo-underground v2.0 — mars 2026 — Version generique Focus OS*
