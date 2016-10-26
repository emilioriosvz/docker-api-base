FROM node

RUN npm install -g pm2@latest
RUN mkdir -p /opt/src
WORKDIR /opt/src

ADD package.json /opt/src/package.json
ADD processes.json /opt/src/processes.json

RUN npm install

EXPOSE 3000
EXPOSE 5858

#http://pm2.keymetrics.io/docs/usage/docker-pm2-nodejs/
CMD ["pm2-docker", "--json", "--watch", "processes.json"]
