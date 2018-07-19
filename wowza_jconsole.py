from jmxquery import JMXConnection, JMXQuery

jmx = JMXConnection("service:jmx:rmi://localhost:8084/jndi/rmi://localhost:8085/jmxrmi",jmx_username="admin", jmx_password="admin", java_path="/usr/local/WowzaStreamingEngine/java/bin/java")

wowza_object = jmx.query([JMXQuery("*:*")])
with open("to_string.txt", "w") as f:
    for i in wowza_object:
        #print(i.to_string())
        f.write(i.to_string() + "\n")

with open("to_query_string.txt", "w") as f:
    for i in wowza_object:
        #print(i.to_query_string())
        f.write(i.to_query_string() + "\n")
print(i.to_query_string())
