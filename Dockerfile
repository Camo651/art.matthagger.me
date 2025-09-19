FROM node:20

RUN apt-get update && apt-get install -y 

COPY . /app

WORKDIR /app

RUN npm install -g vue-cli-service
RUN npm install -g @vue/cli-plugin-babel

CMD ["npm", "run", "build:prod"]