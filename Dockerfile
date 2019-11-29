FROM node:alpine

RUN apk add --no-cache git bash coreutils

RUN NPM_RANK_HEAD_HASH=$(git ls-remote https://gist.github.com/anvaka/8e8fa57c7ee1350e3491 HEAD | awk '{ print $1}')
RUN wget -O top-1000 "https://gist.githubusercontent.com/anvaka/8e8fa57c7ee1350e3491/raw/${NPM_RANK_HEAD_HASH}/01.most-dependent-upon.md"

RUN git clone https://github.com/vishnubob/wait-for-it.git

CMD ./wait-for-it/wait-for-it.sh --strict verdaccio:4873 -- cat top-1000
