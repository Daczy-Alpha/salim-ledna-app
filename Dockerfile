# ---------- BUILD STAGE ----------
FROM node:20 AS builder

WORKDIR /app

# Install dependencies required by sharp
RUN apt-get update && apt-get install -y \
    libc6-dev \
    libvips-dev

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


# ---------- PRODUCTION STAGE ----------
FROM node:20-slim

WORKDIR /app

COPY --from=builder /app ./

ENV NODE_ENV=production

EXPOSE 3000

CMD ["npm","start"]