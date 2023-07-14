FROM node:alpine AS development

# Declaring env
ENV NODE_ENV development
# Setting up the work directory
WORKDIR /react-app

# Installing dependencies
COPY . .

ENV AWSCLI_VERSION='1.29.2'

#RUN apk add --update npm && npm install && npm run build && \
RUN yarn add -D webpack-cli && yarn build && \
apk add py3-pip &&  pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}
RUN chmod ugo+x entrypoint.sh
ENTRYPOINT ["/bin/sh","entrypoint.sh"]
