1. Run mvn clean
2. Run mvn package
3. Run docker build -t petclinic-mysql-docker:1.0.0 .
4. Run docker network create petclinic
5. Run docker run -d --network petclinic --network-alias mysql -v ./conf.d:/etc/mysql/conf.d:ro -e MYSQL_ALLOW_EMPTY_PASSWORD=true -e MYSQL_USER=petclinic -e MYSQL_PASSWORD=petclinic -e MYSQL_DATABASE=petclinic mysql:8.0
6. Run docker logs -f <CONTAINER ID>, make sure MySQL is running
7. Run docker run -dp 80:80 --network petclinic -e USER_NAME=petclinic -e USER_PWD=petclinic -e DB_URL=jdbc:mysql://mysql:3306/petclinic petclinic-mysql-docker:1.0.0
8. Test the app http://localhost, make sure everything works fine
9. Run docker stop <APP CONTAINER ID>
10. Run docker remove <APP CONTAINER ID>
11. Run docker image remove petclinic-mysql-docker:1.0.0
12. Run docker stop <MYSQL CONTAINER ID>
13. Run docker remove <MYSQL CONTAINER ID>
14. Run docker image remove mysql:8.0