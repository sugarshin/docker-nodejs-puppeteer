FROM node:10.15.1

MAINTAINER Shingo Sato <shinsugar@gmail.com>

RUN apt-get update && \
  apt-get -y install \
    xvfb gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 \
    libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 \
    libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 \
    libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 \
    libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release ttf-freefont udev \
    xdg-utils wget && \
  rm -rf /var/lib/apt/lists/*

ENV PUPPETEER_VERSION '1.7.0'

RUN yarn global add puppeteer@$PUPPETEER_VERSION && yarn cache clean

ENV NODE_PATH="/usr/local/share/.config/yarn/global/node_modules:${NODE_PATH}"

ENTRYPOINT ["/bin/bash"]
