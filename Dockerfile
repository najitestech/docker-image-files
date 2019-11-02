FROM centos:centos7

MAINTAINER kelvin.ikpeni@dcssp.com

RUN mkdir /opt/tomcat/

RUN yum install -y tar && \
    yum install -y curl && \
    yum install -y vim

WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.47/bin/apache-tomcat-8.5.47.tar.gz
RUN tar xvzf apache-tomcat*.tar.gz
RUN mv apache-tomcat-8.5.47/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

COPY tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/bin/bash","/opt/tomcat/bin/catalina.sh", "run"]
