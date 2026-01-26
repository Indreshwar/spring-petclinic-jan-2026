#First stage to build the maven package
FROM maven:3.9-eclipse-temurin-17 AS build
ADD . /app
WORKDIR /app
RUN mvn package

#second stage to run the application
FROM eclipse-temurin:17-jre-alpine
LABEL project="petclinic"
LABEL Author="Indra"
RUN adduser -D -h /usr/share/spc -s /bin/sh spc
USER spc
WORKDIR /usr/share/spc
COPY --from=build /app/target/spring-petclinic-4.0.0-SNAPSHOT.jar spring-petclinic-4.0.0-SNAPSHOT.jar
EXPOSE 8080
CMD ["java","-jar","spring-petclinic-4.0.0-SNAPSHOT.jar"]

