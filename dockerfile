FROM node:alpine as baseimage
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build

FROM nginx
COPY --from=baseimage /app/build /usr/share/nginx/html

