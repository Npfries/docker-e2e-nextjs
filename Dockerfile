FROM node:18 AS base

WORKDIR /app

COPY package*.json .

RUN npm ci

COPY . .

FROM base AS builder

RUN npm run build

CMD []

FROM base AS builder_static

COPY next.static.config.js /app/next.config.js

RUN npm run build

CMD []

FROM builder AS start

ENTRYPOINT [ "npm", "run", "start" ]

FROM base AS dev

ENTRYPOINT ["npm", "run", "dev"]

FROM node:18-alpine AS prod

WORKDIR /app

COPY --from=base /app/package*.json .
COPY --from=base /app/node_modules/ ./node_modules/
COPY --from=builder /app/.next/ ./.next/
COPY --from=base /app/public/ ./public/

ENTRYPOINT ["npm", "run", "start"]

FROM httpd:2.4 AS prod_static

COPY --from=builder_static /app/out/ /usr/local/apache2/htdocs/
