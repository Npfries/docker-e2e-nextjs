FROM node:18 AS base

WORKDIR /app

COPY package*.json ./

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

ENTRYPOINT [ "npm", "run", "start:docker" ]

FROM base AS dev

ENTRYPOINT ["npm", "run", "dev:docker"]

FROM node:18-alpine AS prod

WORKDIR /app

COPY --from=base /app/package*.json ./
COPY --from=base /app/node_modules/ ./node_modules/
COPY --from=base /app/public/ ./public/
COPY --from=builder /app/.next/ ./.next/

ENTRYPOINT ["npm", "run", "start:docker"]

FROM httpd:2.4 AS prod_static

COPY --from=builder_static /app/out/ /usr/local/apache2/htdocs/
