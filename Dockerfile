FROM docker-registry.default.svc:5000/wwp-test/node:20-alpine

RUN \
  apk update && \
  apk add --no-cache dumb-init tzdata

ENV TZ="Europe/Zurich" \
    NODE_ENV="production"

USER node
WORKDIR /usr/src/app

COPY --chown=node:node package*.json ./

RUN \
  npm ci --omit=dev && \
  npm cache clean --force

COPY --chown=node:node src ./

EXPOSE 5050

CMD [ "node", "server.js" ]
