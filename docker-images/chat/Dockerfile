FROM node:16-bullseye-slim

WORKDIR /usr/app

COPY ./ ./

RUN npm install -timeout=600000

CMD ["npm","run","start"] 