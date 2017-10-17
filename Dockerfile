FROM node:8.7.0-alpine

LABEL "maintainer": "adam.berkowitz@uconn.edu" \
  "name": "Adam Berkowitz" \
  "project": "node test"

WORKDIR /project

COPY ./package.json /project/package.json
COPY ./.entrypoint/entrypoint.sh /entrypoint.sh

RUN apk update && apk add bash \
  && chmod +x /entrypoint.sh \
  && npm set progress=false \
  && npm install -g yarn gatsby-cli

EXPOSE 8000

ENTRYPOINT [ "/entrypoint.sh" ]