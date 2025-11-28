FROM node:18 as builder

WORKDIR /build

COPY package*.json ./
RUN npm install

COPY src/ ./src
COPY tsconfig.json ./

RUN npm run build


# ---- Runner Stage ----
FROM node:18 as runner

WORKDIR /app

# Copy package.json for npm start to work
COPY --from=builder /build/package*.json ./

# Copy node_modules from builder
COPY --from=builder /build/node_modules ./node_modules/

# Copy transpiled JS output
COPY --from=builder /build/dist ./dist/

CMD ["node", "dist/index.js"]
# or if you want npm start:
# CMD ["npm", "start"]
