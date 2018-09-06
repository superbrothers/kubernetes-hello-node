ARG NODE_VERSION=

FROM node:$NODE_VERSION

WORKDIR /src/app

COPY package*.json ./

RUN set -x && \
    npm install --production

COPY . .

ENV NODE_ENV production
USER node
EXPOSE 8080
CMD ["node", "server.js"]
