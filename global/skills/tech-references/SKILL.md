---
name: tech-references
description: Stack technique recommandee, conventions code, patterns architecture, securite, Docker, testing, performance. Consulter avant tout travail backend/infra.
triggers:
  - "stack"
  - "architecture"
  - "API"
  - "database"
  - "deploy"
  - "securite"
  - "backend"
  - "Docker"
  - "tests"
  - "performance"
  - "TypeScript"
  - "Next.js"
  - "Supabase"
---

# Tech References — Bibliotheque technique

> Conventions et stack recommandees pour 2026. Source: experience terrain, docs officielles, OWASP.
> Derniere MaJ: mars 2026

---

## 1. STACK RECOMMANDEE 2026

| Couche | Outil | Pourquoi |
|--------|-------|---------|
| Framework | Next.js 15+ (App Router) | RSC, streaming, edge-ready |
| Styling | Tailwind CSS v4 + OKLCH | Utility-first, tokens natifs, zero runtime CSS |
| Base de donnees | Supabase (PostgreSQL) | Auth + DB + Storage + Realtime en un seul service |
| Auth | Supabase Auth | Social login, magic link, JWT, RLS integre |
| ORM | Drizzle (prefere) ou Prisma | Drizzle = plus leger, plus proche SQL, meilleurs types |
| Validation | Zod | Runtime + TypeScript, schemas partageables front/back |
| State global | Zustand | Leger, pas de boilerplate, facile a deboguer |
| State server | TanStack Query | Cache, revalidation, optimistic updates |
| Forms | React Hook Form + Zod | Performance + validation unifiee |
| Email | Resend + React Email | Dev-friendly, templates JSX, deliverabilite |
| Paiement | Stripe | Standard industrie, webhooks fiables |
| Deploy frontend | Vercel | Zero-config Next.js, previews auto par PR |
| Deploy backend | Hostinger VPS + PM2 | Controle total, FastAPI/Node, SSH |
| CI/CD | GitHub Actions | Integre au repo, gratuit pour projets prives |
| Monitoring erreurs | Sentry | Source maps, alertes, performance traces |
| Analytics | PostHog (prefere) ou Plausible | PostHog = funnels + session replay. Plausible = privacy-first simple |
| Rate limiting | Upstash Redis | Serverless Redis, compatible edge |
| Search | Meilisearch ou Algolia | Meilisearch self-hosted = moins cher |
| Queue jobs | BullMQ (Redis) | Pour taches asynchrones (emails, exports, webhooks) |
| Cron | Vercel Cron ou cron-job.org | Cron serverless simple, pas de serveur dedie |

---

## 2. CONVENTIONS TYPESCRIPT

### Regles de base
- `strict: true` TOUJOURS dans tsconfig.json — jamais de shortcut
- Pas de `any` — utiliser `unknown` + type guards ou assertions
- Pas de `!` (non-null assertion) — gerer les cas null explicitement
- Exports nommes uniquement (pas de `export default`) — meilleur tree-shaking + refactoring
- Fichiers: `camelCase.ts`, composants: `PascalCase.tsx`
- Dossiers: `kebab-case/`
- Interfaces > Types pour les objets extensibles
- Types > Interfaces pour unions, intersections, primitives

### Zod — regles d'usage
- Validation runtime aux boundaries: API input, form submit, env variables
- Partager les schemas entre front et back (dossier `lib/schemas/`)
- `z.infer<typeof schema>` pour les types TypeScript derives
- Ne pas re-valider ce qui est deja type-safe a l'interieur des fonctions

### Exemple structure types
```typescript
// lib/schemas/user.schema.ts
import { z } from 'zod'

export const UserSchema = z.object({
  id: z.string().uuid(),
  email: z.string().email(),
  role: z.enum(['admin', 'user', 'guest']),
  createdAt: z.date(),
})

export type User = z.infer<typeof UserSchema>

// Utilisation API
export const CreateUserSchema = UserSchema.omit({ id: true, createdAt: true })
export type CreateUserPayload = z.infer<typeof CreateUserSchema>
```

---

## 3. PATTERNS ARCHITECTURE NEXT.JS 15

### Quand utiliser quoi
| Pattern | Usage | Exemple |
|---------|-------|---------|
| Server Components (RSC) | Data fetching, DB queries, sans interactivite | Pages, listes de donnees |
| Client Components ('use client') | Interactivite, state, evenements browser | Formulaires, menus, animations |
| Server Actions | Mutations, form submit, acces DB direct | Creer/modifier/supprimer |
| Route Handlers | API endpoints REST pour services externes | Webhooks Stripe, integ tierces |
| Middleware | Auth, redirects, A/B testing, i18n | Proteger les routes |
| Parallel Routes | Vues simultanees dans le meme layout | Dashboard avec side panel |
| Intercepting Routes | Modals sans quitter la page | Galerie photo, previews |

### Structure dossiers recommandee
```
app/
  (auth)/          # Route group sans layout
    login/
    register/
  (dashboard)/
    layout.tsx     # Layout dashboard avec auth check
    page.tsx
  api/
    webhooks/
      stripe/route.ts
components/
  ui/              # Shadcn/ui ou composants atomiques
  features/        # Composants metier (par feature)
  layouts/         # Headers, footers, sidebars
lib/
  supabase/        # Client Supabase (server + client)
  schemas/         # Schemas Zod partages
  utils/           # Fonctions pures utilitaires
  actions/         # Server Actions (mutations)
hooks/             # Custom hooks client
types/             # Types globaux non-lies a un schema
```

### Data fetching — ordre de priorite
1. RSC direct (Server Component fetch dans la page) — le plus simple
2. Server Actions (pour les mutations)
3. TanStack Query + Route Handler (si besoin cache client / invalidation complexe)
4. SWR (alternatif leger a TanStack Query)

---

## 4. BASE DE DONNEES — SUPABASE ET POSTGRESQL

### Conventions nommage
- Tables: `snake_case` pluriel — `users`, `orders`, `product_variants`
- Colonnes: `snake_case` — `created_at`, `user_id`, `is_active`
- Cles primaires: toujours `id uuid DEFAULT gen_random_uuid()`
- Timestamps: toujours `created_at TIMESTAMPTZ DEFAULT now()` + `updated_at`
- Cles etrangeres: `{table_singulier}_id` — `user_id`, `order_id`

### Colonnes obligatoires sur chaque table
```sql
id          UUID         DEFAULT gen_random_uuid() PRIMARY KEY,
created_at  TIMESTAMPTZ  DEFAULT now() NOT NULL,
updated_at  TIMESTAMPTZ  DEFAULT now() NOT NULL
```

### RLS (Row Level Security) — regles
- Activer RLS sur CHAQUE table sans exception
- Politique minimale par defaut: tout interdire
- Ajouter des politiques explicites pour SELECT, INSERT, UPDATE, DELETE
- Tester les politiques avec un user non-authentifie

```sql
-- Template RLS basique
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;

-- Users voient seulement leurs propres donnees
CREATE POLICY "users_own_orders" ON orders
  FOR ALL USING (auth.uid() = user_id);

-- Admins voient tout
CREATE POLICY "admins_all_orders" ON orders
  FOR ALL USING (
    EXISTS (SELECT 1 FROM users WHERE id = auth.uid() AND role = 'admin')
  );
```

### Indexes — quand en ajouter
- Toujours sur les colonnes WHERE frequentes
- Toujours sur les cles etrangeres (FK)
- Index partiel si la majorite des lignes est filtree
- Verifier `EXPLAIN ANALYZE` avant/apres sur les queries lentes

```sql
-- Indexes essentiels
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_status ON orders(status) WHERE status != 'completed';
CREATE INDEX idx_users_email ON users(email);
```

### Migrations
- Utiliser Drizzle Kit ou Supabase CLI pour les migrations
- Nommer: `001_create_users.sql`, `002_add_orders.sql`
- Chaque migration doit avoir son reverse (rollback)
- Tester en local avant de pousser en staging

---

## 5. SECURITE — CHECKLIST OWASP TOP 10

| Risque | Protection | Implementation |
|--------|-----------|----------------|
| **Injection** | ORM parametre uniquement, jamais SQL brut | Drizzle/Prisma, concatenation interdite |
| **Broken Auth** | Supabase Auth + RLS + middleware | Verifier session dans middleware |
| **XSS** | Echapper le HTML, sanitize le contenu user | DOMPurify si HTML user-generated |
| **Broken Access Control** | RLS Supabase + checks serveur | Ne jamais faire confiance au client |
| **Security Misconfiguration** | Headers HTTP, CORS strict, env vars | `next.config.js` headers() |
| **Cryptographic Failures** | HTTPS force, pas de secrets en clair | `.env.local` gitignored |
| **SSRF** | Valider les URLs externes | Whitelist domaines autorises |
| **CSRF** | SameSite cookies, Server Actions (built-in) | Next.js Server Actions = protege nativement |
| **Vulnerable Components** | `npm audit` regulier, Dependabot | Alert auto GitHub + fix patch |
| **Logging Failures** | Sentry + logs structure, PAS de donnees sensibles | Jamais logger email/mdp/token |

### Security headers (next.config.js)
```javascript
const securityHeaders = [
  { key: 'X-DNS-Prefetch-Control', value: 'on' },
  { key: 'Strict-Transport-Security', value: 'max-age=63072000; includeSubDomains; preload' },
  { key: 'X-Frame-Options', value: 'SAMEORIGIN' },
  { key: 'X-Content-Type-Options', value: 'nosniff' },
  { key: 'Referrer-Policy', value: 'origin-when-cross-origin' },
  { key: 'Permissions-Policy', value: 'camera=(), microphone=(), geolocation=()' },
]
```

### Rate limiting (Upstash Redis)
```typescript
import { Ratelimit } from '@upstash/ratelimit'
import { Redis } from '@upstash/redis'

const ratelimit = new Ratelimit({
  redis: Redis.fromEnv(),
  limiter: Ratelimit.slidingWindow(10, '10 s'), // 10 req / 10s
})

// Dans un Route Handler ou Server Action
const { success } = await ratelimit.limit(ip)
if (!success) return new Response('Too Many Requests', { status: 429 })
```

---

## 6. DOCKER ET ENVIRONNEMENTS

### Structure Docker recommandee
```dockerfile
# Dockerfile — Next.js production (multi-stage)
FROM node:20-alpine AS base

# Stage dependencies
FROM base AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

# Stage builder
FROM base AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Stage runner (final, minimal)
FROM base AS runner
WORKDIR /app
ENV NODE_ENV=production
COPY --from=deps /app/node_modules ./node_modules
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/package.json ./package.json
EXPOSE 3000
CMD ["npm", "start"]
```

### docker-compose.yml pattern
```yaml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "3000:3000"
    env_file:
      - .env.local
    depends_on:
      - redis
    restart: unless-stopped

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"
    volumes:
      - redis_data:/data
    restart: unless-stopped

  postgres:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: appdb
      POSTGRES_USER: ${DB_USER}
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    volumes:
      - pg_data:/var/lib/postgresql/data
    restart: unless-stopped

volumes:
  redis_data:
  pg_data:
```

### OrbStack (Mac) — commandes cles
```bash
# Lancer environnement local
docker compose up -d

# Voir les logs en temps reel
docker compose logs -f app

# Entrer dans un container
docker compose exec app sh

# Rebuild apres changement Dockerfile
docker compose up -d --build app

# Supprimer tout (volumes inclus)
docker compose down -v
```

### Variables d'environnement — organisation
```
.env.local          # Local uniquement, JAMAIS git
.env.example        # Template sans valeurs, COMMITER
.env.staging        # Staging (secrets dans CI/CD, pas en clair)
.env.production     # Production (secrets dans Vercel/Hostinger)
```

---

## 7. TESTING — STRATEGIE ET OUTILLAGE

### Pyramide de tests recommandee
```
         /\
        /  \      E2E (Playwright) — 10%
       /    \     Peu de tests, haut niveau
      /------\
     /        \   Integration (Vitest + Supertest) — 30%
    /          \  API routes, DB, business logic
   /------------\
  /              \ Unit (Vitest) — 60%
 /                \ Fonctions pures, utils, schemas Zod
/__________________\
```

### Setup Vitest (unit + integration)
```typescript
// vitest.config.ts
import { defineConfig } from 'vitest/config'
import react from '@vitejs/plugin-react'
import path from 'path'

export default defineConfig({
  plugins: [react()],
  test: {
    environment: 'node',
    globals: true,
    setupFiles: ['./tests/setup.ts'],
  },
  resolve: {
    alias: { '@': path.resolve(__dirname, './') },
  },
})
```

### Tests d'integration — regles
- Toujours tester contre une vraie base de donnees (pas de mock DB)
- Utiliser une base de test separee (variable `DATABASE_URL_TEST`)
- `beforeEach` : nettoyer les tables touchees
- `afterAll` : fermer les connexions proprement

```typescript
// Exemple test integration Server Action
import { createOrder } from '@/lib/actions/orders'
import { db } from '@/lib/db'

describe('createOrder', () => {
  beforeEach(async () => {
    await db.delete(orders) // Nettoyer
  })

  it('should create an order for authenticated user', async () => {
    const result = await createOrder({ productId: 'test-id', quantity: 2 })
    expect(result.data).toBeDefined()
    expect(result.error).toBeNull()
  })

  it('should reject unauthenticated request', async () => {
    const result = await createOrder({ productId: 'test-id', quantity: 2 })
    expect(result.error?.code).toBe('UNAUTHORIZED')
  })
})
```

### Playwright (E2E)
```typescript
// tests/e2e/auth.spec.ts
import { test, expect } from '@playwright/test'

test('user can login and access dashboard', async ({ page }) => {
  await page.goto('/login')
  await page.fill('[name="email"]', 'test@example.com')
  await page.fill('[name="password"]', 'password123')
  await page.click('[type="submit"]')
  await expect(page).toHaveURL('/dashboard')
  await expect(page.locator('h1')).toContainText('Dashboard')
})
```

### Ce qu'on NE teste pas
- L'UI pure (couleurs, positions) — trop fragile, peu de valeur
- Les libraries tierces (elles ont leurs propres tests)
- Les types TypeScript (le compilateur le fait)

---

## 8. PERFORMANCE — CHECKLIST

### Next.js
- `next/image` TOUJOURS pour les images (lazy load + optimisation auto)
- `next/font` pour les polices (pas de FOUT, preload auto)
- `loading.tsx` sur chaque page (Suspense boundaries)
- `generateStaticParams` pour les routes dynamiques previsibles
- Eviter les gros Client Components — garder la logique dans les RSC
- Bundle analyzer: `ANALYZE=true npm run build`

### Web Vitals cibles (Core Web Vitals 2026)
| Metrique | Cible | Outils |
|----------|-------|--------|
| LCP (Largest Contentful Paint) | < 2.5s | Lighthouse, PageSpeed Insights |
| INP (Interaction to Next Paint) | < 200ms | Chrome DevTools |
| CLS (Cumulative Layout Shift) | < 0.1 | Lighthouse |
| TTFB (Time to First Byte) | < 800ms | WebPageTest |
| FCP (First Contentful Paint) | < 1.8s | Lighthouse |

### Base de donnees — performance
- Toujours paginer les resultats (cursor-based > offset)
- Limiter les `SELECT *` — lister explicitement les colonnes
- N+1 queries: utiliser les joins ou `include` Prisma / Drizzle relations
- Connection pooling: PgBouncer (Supabase l'inclut)
- Cache Redis pour les queries frequentes et non-critiques

```typescript
// Cursor-based pagination
async function getOrders(cursor?: string, limit = 20) {
  return db.query.orders.findMany({
    where: cursor ? gt(orders.id, cursor) : undefined,
    limit: limit + 1, // +1 pour savoir s'il y a une page suivante
    orderBy: [asc(orders.id)],
  })
}
```

### API — optimisations
- Compression gzip/brotli (Vercel l'active auto)
- Cache HTTP: `Cache-Control` headers sur les routes stables
- Streaming: `StreamingResponse` pour les reponses larges
- Edge Runtime pour les routes simples sans Node.js deps

---

## 9. CONVENTIONS GIT ET DEPLOY

### Conventional commits
```
feat(auth): add magic link login
fix(api): handle null user in orders endpoint
refactor(db): migrate to Drizzle from Prisma
test(orders): add integration tests for createOrder
chore(deps): update Next.js to 15.2
docs(readme): update setup instructions
```

### Branches
```
main        <- Production, protegee, merge via PR uniquement
staging     <- Pre-prod, tests finaux
feature/*   <- Nouvelles features (feature/user-auth)
fix/*       <- Corrections (fix/login-redirect)
hotfix/*    <- Fixes urgents prod (hotfix/stripe-webhook)
```

### Checklist avant PR
- [ ] `npm run build` passe sans erreurs
- [ ] `npm run lint` zero warnings
- [ ] Tests unitaires et integration passent
- [ ] Pas de `console.log` oublies
- [ ] Variables d'env documentees dans `.env.example`
- [ ] Migration DB incluse si schema change
- [ ] Pas de secrets dans le diff

### Deploy Vercel — variables a configurer
```
NEXT_PUBLIC_SUPABASE_URL
NEXT_PUBLIC_SUPABASE_ANON_KEY
SUPABASE_SERVICE_ROLE_KEY
DATABASE_URL
STRIPE_SECRET_KEY
STRIPE_WEBHOOK_SECRET
RESEND_API_KEY
UPSTASH_REDIS_REST_URL
UPSTASH_REDIS_REST_TOKEN
```

### Deploy Hostinger (VPS) avec PM2
```bash
# ecosystem.config.js
module.exports = {
  apps: [{
    name: 'api',
    script: 'dist/main.js',
    instances: 'max',
    exec_mode: 'cluster',
    env_production: {
      NODE_ENV: 'production',
      PORT: 3001,
    },
  }],
}
```

---

## 10. CONVENTIONS API REST

### Standards de reponse
- Status: 200 OK, 201 Created, 400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found, 500 Server Error
- Format uniforme:
  - Succes: `{ data: T, error: null }`
  - Erreur: `{ data: null, error: { message: string, code: string } }`
- Pagination cursor-based (jamais offset sur les grosses tables)
- Rate limiting: 429 Too Many Requests avec header `Retry-After`

### Conventions REST
- GET = lire (idempotent, cacheable)
- POST = creer (non-idempotent)
- PUT = remplacer completement
- PATCH = modifier partiellement
- DELETE = supprimer (idempotent)
- Routes en kebab-case: `/api/user-orders` pas `/api/userOrders`

---

## 11. ANTI-PATTERNS A EVITER

| Anti-pattern | Probleme | Solution |
|-------------|---------|---------|
| `getServerSideProps` dans Next.js 15 | App Router ne le supporte plus | RSC + fetch direct |
| `useState` pour data server | Double fetch, stale data | TanStack Query ou RSC |
| SQL brut concatene | Injection SQL | Drizzle / Prisma parametres |
| Pas de RLS sur Supabase | N'importe qui lit tout | Activer RLS + politiques |
| `npm install` en prod | Installe devDeps | `npm ci --only=production` |
| Secrets dans le code | Exposition dans git | `.env.local` + gitignore |
| `any` en TypeScript | Perd le type-safety | `unknown` + type guards |
| Pas de rate limiting | Abus, DDoS, scrapers | Upstash Redis ratelimit |
| Logs avec donnees sensibles | RGPD, securite | Logger uniquement IDs, pas valeurs |
| Migration sans rollback | Impossible a revenir en arriere | Ecrire le DOWN pour chaque UP |
| Mock DB dans les tests | Divergence test/prod | Base de test reelle |
| SELECT * partout | Performance, sur-fetch | Colonnes explicites |
