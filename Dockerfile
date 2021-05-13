from squidfunk/mkdocs-material AS build-env

COPY . /docs/

WORKDIR /docs
RUN mkdocs build

FROM nginx
COPY --from=build-env /docs/site /usr/share/nginx/html