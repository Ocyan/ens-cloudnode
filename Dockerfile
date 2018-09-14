FROM node:10-alpine

RUN apk add --no-cache --virtual native-deps \
  g++ gcc libgcc libstdc++ linux-headers \
  git make python && \
  npm install --quiet node-gyp -g

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN npm install -g ganache-cli

COPY . /usr/src/app
COPY package.json /usr/src/app/

RUN yarn install

RUN apk del native-deps

RUN yarn run build

RUN mkdir -p /etc/ganache-cli/ganache.db

EXPOSE 8545

CMD [ "yarn", "run", "truffle" ]
