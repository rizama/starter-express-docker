# Multi-Stage Build
FROM node:14 AS base
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --only=production

FROM node:14-alpine
WORKDIR /usr/src/app
COPY --from=base /usr/src/app .
COPY . .

EXPOSE 5000

CMD npm start