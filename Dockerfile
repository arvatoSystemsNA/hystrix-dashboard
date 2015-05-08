FROM nexus49/java8:wheezy

WORKDIR /opt/hystrix-dashboard

EXPOSE 8080
RUN apt-get update && apt-get install curl -y
RUN curl https://repo1.maven.org/maven2/com/netflix/hystrix/hystrix-dashboard/1.4.7/hystrix-dashboard-1.4.7.war -o hystrix-dashboard.war 
RUN curl https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-runner/9.2.7.v20150116/jetty-runner-9.2.7.v20150116.jar -o jetty-runner.jar


CMD [ "java", "-jar", "jetty-runner.jar", "hystrix-dashboard.war" ]
