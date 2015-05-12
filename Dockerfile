FROM nexus49/java8:wheezy

EXPOSE 8080
RUN apt-get update && \
    apt-get install curl git -y  && \
    mkdir /opt/jetty && \
    curl https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-runner/9.2.7.v20150116/jetty-runner-9.2.7.v20150116.jar -o /opt/jetty/jetty-runner.jar && \
    git clone https://github.com/Netflix/Hystrix /opt/hystrix-dashboard  && \
    cd /opt/hystrix-dashboard/hystrix-dashboard/ && \
    ../gradlew war

CMD [ "java", "-jar", "/opt/jetty/jetty-runner.jar", "/opt/hystrix-dashboard/hystrix-dashboard/build/libs/hystrix-dashboard-1.5.0-SNAPSHOT.war" ]
