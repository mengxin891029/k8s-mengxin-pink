FROM node:16-bullseye-slim

WORKDIR /usr/app

COPY ./ ./

RUN npm config set fetch-retry-maxtimeout 60000

RUN npm install -timeout=60000

CMD ["npm","run","start"] 