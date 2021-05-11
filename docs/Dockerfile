from squidfunk/mkdocs-material AS build-env

ARG lang
COPY $lang /docs/

WORKDIR /docs
RUN mkdocs build

FROM nginx
COPY --from=build-env /docs/site /usr/share/nginx/html