# ref: https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#running-puppeteer-in-docker

FROM sugarshin/puppeteer-base:2.0.0

LABEL maintainer "Shingo Sato <shinsugar@gmail.com>"

ADD package.json package-lock.json /
RUN npm ci

RUN groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser \
  && mkdir -p /home/pptruser/Downloads \
  && chown -R pptruser:pptruser /home/pptruser \
  && chown -R pptruser:pptruser /node_modules \
  && chown -R pptruser:pptruser /package.json \
  && chown -R pptruser:pptruser /package-lock.json

USER pptruser
