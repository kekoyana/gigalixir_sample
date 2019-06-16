FROM elixir:1.8.2-alpine

ENV NODE_VERSION 10.x

RUN apk add --update --no-cache \
    bash \
    nodejs \
    inotify-tools \
    npm \
    postgresql-dev \
    postgresql \
    wget \
    curl \
    vim \
    git

RUN mix local.hex --force && \
  mix archive.install hex phx_new 1.4.8 --force && \
  mix local.rebar --force

WORKDIR /app/assets
RUN npm install
WORKDIR /app


CMD ["/app/bin/entrypoint.sh"]
