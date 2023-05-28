# syntax=docker/dockerfile:1
FROM alpine:latest AS pyserver
WORKDIR /app

RUN apk add python3 git py3-pip libmagic curl
RUN git clone https://gitlab.com/elixire/elixire.git .
RUN python3 -m pip install -Ur requirements.txt

EXPOSE 8081
CMD hypercorn run.py --access-log - --bind 0.0.0.0:8081

FROM postgres:latest AS db

WORKDIR /docker-entrypoint-initdb.d/
ENV HOST=breadboard.dogworld.int.eu.org
ENV POSTGRES_PASSWORD example

# Copy schema from previous stage to initdb.d, which postgres initalizes
COPY --from=0 /app/schema.sql ./
RUN sed -i "s/0, 'elixi.re'/0, '$HOST'/g" schema.sql
