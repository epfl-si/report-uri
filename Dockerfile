FROM node:20-alpine

RUN \
  apk update && \
  apk add --no-cache dumb-init tzdata

ENV TZ="Europe/Zurich" \
    NODE_ENV="production"

WORKDIR /usr/src/app

COPY --chown=node:node package*.json ./

USER root

RUN \
  npm ci --omit=dev && \
  npm cache clean --force

COPY --chown=node:node src ./

USER node

EXPOSE 5050

CMD [ "node", "server.js" ]
