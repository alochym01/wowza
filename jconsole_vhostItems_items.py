#https://www.wowza.com/docs/how-to-use-jconsole-with-wowza-media-server#remoteJMXConfigObjectList
from jmxquery import JMXConnection, JMXQuery

jmx = JMXConnection("service:jmx:rmi://localhost:8084/jndi/rmi://localhost:8085/jmxrmi",jmx_username="admin", jmx_password="admin", java_path="/usr/local/WowzaStreamingEngine/java/bin/java")

wowza_object = jmx.query([JMXQuery("WowzaStreamingEngine:vhostItems=*,vhostItem=*,name=*")])
#with open("WowzaStreamingEngine_properties.txt", "w") as f:
#    for i in wowza_object:
        #print(i.to_string())
#        f.write(i.to_string() + "\n")
for i in wowza_object:
    print('{0} value is {1}'.format(i.to_query_string(), i.value))
