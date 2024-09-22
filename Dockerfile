FROM node:18-alpine as build-frontend

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm build

FROM node:18-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "src/page.tsx"]