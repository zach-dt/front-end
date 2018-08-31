FROM node:4-alpine
ENV NODE_ENV "production"
ENV PORT 8080
EXPOSE 8080
RUN addgroup mygroup && adduser -D -G mygroup myuser && mkdir -p /usr/src/app && chown -R myuser /usr/src/app

# Prepare app directory
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
COPY yarn.lock /usr/src/app/
RUN chown myuser /usr/src/app/yarn.lock

USER myuser
RUN yarn install

COPY . /usr/src/app

# Start the app
# CMD ["/usr/local/bin/npm", "start", "--domain=apps.pcfeu.dev.dynatracelabs.com"] << Paramater does not work, but is needed for all endpoints.
CMD ["/usr/local/bin/npm", "start"]
