FROM openjdk:8u121-jre-alpine
MAINTAINER  chakra.bre@gmail.com
WORKDIR  /var/hello-dropwizard
ADD target/hello-dropwizard-1.0-SNAPSHOT.jar  /var/hello-dropwizard/hello-dropwizard.jar
ADD  example.yml  /var/hello-dropwizard/example.yaml  
EXPOSE  8080 8081
 ENTRYPOINT ["java", "-jar", "hello-dropwizard.jar", "server", "example.yml"]
