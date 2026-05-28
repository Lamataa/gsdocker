# ---- Estágio 1: build ----
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

# ---- Estágio 2: imagem final (menor e segura) ----
FROM node:20-alpine AS production
ENV NODE_ENV=production
WORKDIR /app

# Usuário não-root (segurança)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY --from=builder /app/node_modules ./node_modules
COPY . .

RUN chown -R appuser:appgroup /app
USER appuser

EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=5s --start-period=15s --retries=3 \
  CMD wget -qO- http://localhost:3000/health || exit 1

# CORRIGIDO: era "server.js", o correto é "src/server.js"
CMD ["node", "src/server.js"]