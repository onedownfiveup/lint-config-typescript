FROM node:6.13-alpine

# Setup environment
ARG ARTIFACTORY_API_KEY
ARG ARTIFACTORY_USER
ENV APP_ROOT /app

# Create app dir
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

# Configure NPM for Artifactory
RUN true \
  && apk add --no-cache --virtual .deps-npm-config curl \
  && touch ~/.npmrc \
  && echo "package-lock=false" >> ~/.npmrc \
  && echo "registry=https://casecommons.jfrog.io/casecommons/api/npm/npm/" >> ~/.npmrc \
  && echo "save-exact=true" >> ~/.npmrc \
  && (test -n "$ARTIFACTORY_API_KEY" || (echo "FATAL: missing ARTIFACTORY_API_KEY" >&2; exit 1)) \
  && (test -n "$ARTIFACTORY_USER" || (echo "FATAL: missing ARTIFACTORY_USER" >&2; exit 1)) \
  && curl --user "${ARTIFACTORY_USER}":"${ARTIFACTORY_API_KEY}" https://casecommons.jfrog.io/casecommons/api/npm/auth >> ~/.npmrc \
  && apk del .deps-npm-config

# Install application dependencies
COPY package.json $APP_ROOT
RUN true \
  && apk add --no-cache --virtual .deps-yarn-install git \
  && rm -rf node_modules \
  && yarn install --no-progress \
  && apk del .deps-yarn-install

# Copy app
COPY . $APP_ROOT
