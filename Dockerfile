FROM node:16-slim
RUN apt-get update && apt-get install --no-install-recommends -yq \
    libgconf-2-4 libxss1 libxtst6 libxshmfence1 ca-certificates wget curl \
    gnupg2 python
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE 1
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub |\
    apt-key add -
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get install -y google-chrome-unstable git \
    fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* /src/*.deb
RUN mkdir -p /usr/share/fonts/emoji \
    && curl --location --silent --show-error --out \
    /usr/share/fonts/emoji/emojione-android.ttf \
    https://github.com/emojione/emojione-assets/releases/download/3.1.2/emojione-android.ttf \
    && chmod -R +rx /usr/share/fonts/ \
    && fc-cache -fv
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN mkdir /app
COPY .profile.d /app/.profile.d
COPY package.json yarn.lock app/
WORKDIR /app
RUN yarn
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
COPY src src
USER root
CMD yarn start
