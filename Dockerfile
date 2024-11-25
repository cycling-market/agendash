FROM node:20-alpine

ENV NODE_ENV=production \
  MONGODB_URI=mongodb://mongodb \
  COLLECTION=agendaJobs \
  BASE_PATH=/

RUN mkdir -p /agendash
WORKDIR /agendash

COPY package.json /agendash/
RUN npm install && npm cache clean --force

COPY . /agendash
RUN chmod +x /agendash/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/agendash/entrypoint.sh"]