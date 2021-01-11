#FROM centos:centos7
FROM centos:latest

MAINTAINER kelvin.ikpeni@dcssp.com

RUN mkdir /opt/tomcat/

RUN dnf install -y tar && \
    dnf install -y curl && \
    dnf install -y vim

WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.61/bin/apache-tomcat-8.5.61.tar.gz
#RUN tar xvzf apache-tomcat*.tar.gz
#RUN mv apache-tomcat-8.5.47/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

COPY tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/bin/bash","/opt/tomcat/bin/catalina.sh", "run"]
