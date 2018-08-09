# [using Prometheus monitor wowza by Jconsole](https://github.com/prometheus/jmx_exporter)
- Download [prometheus jagent](https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.3.1/jmx_prometheus_javaagent-0.3.1.jar)
- Using [http-server-config.yml](https://raw.githubusercontent.com/alochym01/wowza/master/prometheus/http-server-config.yml)
    
      username is admin -- wowza default
      password is password -- wowza default

      - rules:
        - pattern: ".*"
