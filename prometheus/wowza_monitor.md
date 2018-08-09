# [using Prometheus monitor wowza by Jconsole](https://github.com/prometheus/jmx_exporter)
- Download [prometheus jagent](https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.3.1/jmx_prometheus_javaagent-0.3.1.jar)
- Using [http-server-config.yml](https://raw.githubusercontent.com/alochym01/wowza/master/prometheus/http-server-config.yml)
    
      username is admin -- wowza default
      password is password -- wowza default

      - rules:
        - pattern: ".*"

- Install Oracle jdk version 1.8.0_181
- we are using javaagent in wowza server
    -   run cli 
    
            java -javaagent:./jmx_prometheus_javaagent-0.3.1.jar=8080:httpserver_sample_config.yml -jar jmx_prometheus_httpserver-0.3.2-SNAPSHOT-jar-with-dependencies.jar 5555 httpserver_sample_config.yml

- explain
    -   java agent will connect to wowza jconsole using username/password
    -   when java agent connected, it will push collected data to tiny prometheus http server run at 8080 port to convert meaning metrics for prometheus server
    -   the jmx_prometheus_httpserver run at 5555 port
    -   prometheus server collects all wowza jconsole through 5555 port
