FROM node:14 AS base
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

FROM node:14-alpine
WORKDIR /app
COPY --from=base /app .
COPY . .

EXPOSE 5000

CMD npm start