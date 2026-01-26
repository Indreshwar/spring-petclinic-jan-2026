#FROM instruction used for base image
FROM eclipse-temurin:17-jre-alpine
#LABEL is used to pass metadata
LABEL Project="SPC"
LABEL Author="indershwar"
#WORKDIR is like cd command in linux (on which path it needs to be)
WORKDIR /usr/share/spc
#RUN is used to execute the command while mage is building
RUN adduser -D -h /usr/home/spc -s /bin/sh
#USER is to set to specific user 
USER spc
#ADD is used to copy files from local into the image
ADD target/spring-petclincic-4.0.0-SNAPSHOT.jar /usr/share/spc/spring-petclinic-4.0.0-SNAPSHOT.jar
#EXPOSE is used to describe on which port the application is listening
EXPOSE 8080
#CMD  instruction sets the command to be executed when running a container from an image.
CMD ["java","jar","/usr/share/spc/spring-petclinic-4.0.0-SNAPSHOT.jar"]

