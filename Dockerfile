FROM node:14.15.4-alpine

ARG S3_ENDPOINT
ARG S3_BUCKET
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ENV PORT=80
ENV UPLOAD_DESTINATION=aws
ENV S3_ENDPOINT=$S3_ENDPOINT
ENV S3_BUCKET=$S3_BUCKET
ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

WORKDIR /app

COPY .npmrc package.json package-lock.json tsconfig.json /app/
COPY src /app/src/

RUN npm i
RUN npm run build

CMD ["/usr/local/bin/npm", "run", "start"]
