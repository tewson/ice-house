FROM node:alpine

RUN apk add --no-cache git bash coreutils
RUN git clone https://github.com/vishnubob/wait-for-it.git

CMD ./wait-for-it/wait-for-it.sh --strict verdaccio:4873 -- echo "Verdaccio is up."
