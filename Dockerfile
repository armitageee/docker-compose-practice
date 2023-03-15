FROM node:13-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

RUN mkdir -p /home/my-app/app

COPY ./app /home/kali/my-app/app

# станлартная директория /home/app dir
WORKDIR /home/kali/my-app/app

# запуск npm install в /home/app because of WORKDIR
RUN npm install

#
CMD ["node", "server.js"]

