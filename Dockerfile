FROM quay-its.epfl.ch/svc0041/node:22-alpine

RUN \
  apk update && \
  apk add --no-cache dumb-init tzdata

ENV TZ="Europe/Zurich" \
    NODE_ENV="production"

WORKDIR /usr/src/app

COPY package*.json ./

RUN \
  npm ci --omit=dev && \
  npm cache clean --force

COPY src ./

RUN chown -R node:node .

USER node

EXPOSE 5050

CMD [ "dumb-init", "node", "server.js" ]
