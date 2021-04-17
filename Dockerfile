FROM alpine/git as Builder
WORKDIR /usr/src

RUN git clone https://github.com/TobenderZephyr/dsabot.git

FROM node:alpine

WORKDIR /usr/src/app

COPY --from=0 /usr/src/dsabot/ /user/src/app/

COPY package.json /usr/src/app/
RUN npm install

EXPOSE 3000
CMD [ "npm", "start" ]
