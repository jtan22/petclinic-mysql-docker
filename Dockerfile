FROM openjdk:17-alpine
ADD target/petclinic-mysql-docker-1.0.0.jar app.jar
ENTRYPOINT [ "sh", "-c", "java -jar /app.jar" ]
