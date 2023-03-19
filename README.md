# docker-compose-practice
Работа с docker/docker-compose

node js сконфигурирован сразу для заворачивания в контейнер, для запуска локально надо раскомментировать 
let mongoUrlLocal = "mongodb://admin:password@localhost:27017";
и поменять переменные

### Для запуска приложения

1) Создать docker network : <br> ``` docker network create db-network ```
2) Установить и запустить образ mongodb: <br>
   ``` docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb --net db-network mongo ```
3) Запустить mongo express : <br>
   ``` docker run -d -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password --net db-network --name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb mongo-express ```
4) Не обязательно создавать сеть с отдельным именем, достаточно просто указать флаг --net 
5) Откройте mongo-express по адресу http://localhost:8081 и создайте базу данных user-account и коллекцию users внутри неё
6) Запустите приложение из рабочей директории app : <br>
 ``` 
    npm install
    node server.js
 ```
7) Приложение будет доступно по адресу: http://localhost:3000


### С использованием docker-compose
1) Для запуска mongodb и mongo-express: <br>
 ```   docker-compose -f docker-compose.yaml up ```
2) volume для базы настроен , создавать бд и коллекцию не надо
3) Запустить node server 
```
    npm install
    node server.js
```
4) Приложение будет доступно по адресу: http://localhost:3000
### Создание образа приложения
    docker build -t my-app:1.0 .
После чего можно запушить свой образ в приватный репозиторий и добавить путь в файл docker-compose и скомпилировать всё вместе.