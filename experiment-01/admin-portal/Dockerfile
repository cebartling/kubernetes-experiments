FROM node:20-alpine as builder
WORKDIR /usr/server/app
COPY ./package*.json .
RUN npm ci --legacy-peer-deps
COPY ./ .
RUN npm run build

FROM node:20-alpine as final
RUN apk --no-cache update && apk upgrade
WORKDIR /usr/server/app
COPY ./package*.json .
RUN npm ci --omit=dev --legacy-peer-deps

#COPY ./.env .

COPY --from=builder /usr/server/app/public/ public/
COPY --from=builder /usr/server/app/*.js .
COPY --from=builder /usr/server/app/build/ build/
COPY --from=builder /usr/server/app/app/ app/
RUN chown -R 1000: /usr/server/app /root/.npm/
USER 1000
ENV NODE_ENV=production
EXPOSE 3000
CMD ["npm", "run" , "start"]
