#FROM exam-image
FROM jboss-ex180
MAINTAINER Chandra Prakash < cprakash@qcsdclabs.com >
LABEL description="EX180 exam setup"

#RUN mkdir -p /opt/jboss
RUN yum install unzip -y && \
    yum clean all
RUN mkdir -p /opt/jboss7-ex180
COPY jboss7-eap.zip /opt/jboss7-ex180/jboss7-eap.zip 
RUN unzip /opt/jboss7-ex180/jboss7-eap.zip

RUN chown -R jboss:jboss /opt/jboss7-ex180  && \
    chmod -R 755 /opt/jboss7-ex180

#CMD ["/opt/jboss/jboss-7.2/useradd.sh admin redhat123!"]
CMD ["/opt/jboss7-ex180/jboss7-eap/bin/add-user.sh -u chandra redhat"]

ENV JBOSS_HOME /opt/jboss7-ex180/jboss7-eap
#USER jboss
USER jboss

EXPOSE 80 8080 9990 9999
#CMD ["JBOSS_HOME/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "bmanagement", "0.0.0.0"]

CMD ["/opt/jboss7-ex180/jboss7-eap/bin/standalone.sh -D FOREGROUND"]
