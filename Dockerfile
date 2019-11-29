FROM verdaccio/verdaccio

COPY ./conf/config.yaml /verdaccio/conf

USER root
RUN apk add --no-cache git
RUN git --version

USER verdaccio
