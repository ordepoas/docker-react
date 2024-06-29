####################################################### BUILD PHASE
FROM node:20-alpine as builder

WORKDIR /app
# dependecies are only necessary for the build
COPY package.json .
RUN npm install 
COPY . .
#/app/build
RUN npm run build

####################################################### RUN PHASE
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html