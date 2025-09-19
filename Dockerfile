FROM node:20 as build-stage
RUN apt-get update && apt-get install -y 
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build
COPY --from=build-stage /app/dist /www