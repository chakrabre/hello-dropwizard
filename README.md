# Introduction

The Dropwizard Hello World application

# Running The Application

To test the example application run the following commands.

* To package the example run the following from the root dropwizard directory.

        mvn package

* To run the server run.

        java -jar target/hello-dropwizard-1.0-SNAPSHOT.jar server example.yml

* To hit the Hello World example (hit refresh a few times).

	http://localhost:8080/hello-world

	http://localhost:8080/hello-world?name=World

* The healthcheck resource runs the health check class we wrote. You should see something like this:

  * deadlocks: OK
  * template: OK

1.install docker 
yum update 
2. yum install docker -y
3. docker -version
4. sudo -su
5. sudo service restart
6. create docker file
7 build docker image

docker build -t hello-dropwizard .

8. create docker continer 

docker run -it -p 8080:8080 -p 8081:8081 -e version=2.0.0 hello-dropwizard
