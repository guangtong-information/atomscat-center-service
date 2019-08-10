### 本地启动项目(需要java、maven环境)
* 1、docker环境执行以下命令
```
docker run -it -d -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

docker run --name redis -it -d -p 6379:6379 redis

docker run --name elasticsearch -it -d -p 9300:9300 -p 9200:9200 elasticsearch:6.4.3

docker run -it -d --name zookeeper -p 2181:2181 zookeeper
```
* 2、登录数据库后执行以下sql语句，和sql文件夹的表结构跟数据sql文件
```
create database `atomscat-data-center` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```
* 3、启动
```
mvn spring-boot:start
```

### 项目打包(需要java、maven环境)
```
mvn clean package -Dmaven.test.skip=true
```
