#base image

FROM node:alpine as builder

#dependency injection

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


#base image

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
