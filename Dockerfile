#베이스 이미지 명시 <이미지이름>:<태그> 태그 없으면 최신것으로 다운 받음
FROM node:alpine as builder

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build





FROM nginx

COPY --from=builder /usr/src/app/build /usr/share/nginx/html