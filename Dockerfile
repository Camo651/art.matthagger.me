FROM node:20

RUN apt-get update && apt-get install -y 

COPY . /app

WORKDIR /app

RUN npm install -g @vue/cli
RUN npm install -g @vue/cli-service-global

CMD ["npm", "run", "build:prod"]