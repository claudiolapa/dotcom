FROM maven:3.6.1-jdk-8 as maven_builder

RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]

RUN ["mvn","clean","install","-T","2C","-DskipTests=true"]

FROM tomcat:8.5.43-jdk8

COPY sample.war /usr/local/tomcat/webapps/hello.war


