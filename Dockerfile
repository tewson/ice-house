FROM node:alpine

RUN apk add --no-cache git bash coreutils

WORKDIR /home/ice-house

RUN NPM_RANK_HEAD_HASH=$(git ls-remote https://gist.github.com/anvaka/8e8fa57c7ee1350e3491 HEAD | awk '{ print $1}')
RUN wget -O top-1000 "https://gist.githubusercontent.com/anvaka/8e8fa57c7ee1350e3491/raw/${NPM_RANK_HEAD_HASH}/01.most-dependent-upon.md"

COPY lib/main.js .

RUN git clone https://github.com/vishnubob/wait-for-it.git

CMD ./wait-for-it/wait-for-it.sh --strict verdaccio:4873 -- node main.js
