FROM node:20

RUN apt-get update && apt-get install -y 

COPY . /app

WORKDIR /app

ENV NODE_ENV=development

CMD ["npm", "run", "build:prod"]