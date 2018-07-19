#https://www.wowza.com/docs/how-to-use-jconsole-with-wowza-media-server#remoteJMXConfigObjectList
from jmxquery import JMXConnection, JMXQuery

jmx = JMXConnection("service:jmx:rmi://localhost:8084/jndi/rmi://localhost:8085/jmxrmi",jmx_username="admin", jmx_password="admin", java_path="/usr/local/WowzaStreamingEngine/java/bin/java")

java_obj = [
	"java.lang:type=*",
	"com.sun.management:type=*",
	"java.lang:type=*,name=*",
	"java.nio:type=*,name=*",
	"java.util.logging:type=*",
	"JMImplementation:type=*"
]
for obj in java_obj:
    wowza_object = jmx.query([JMXQuery(obj)])
    for i in wowza_object:
        print(i.to_string())
        #print('{0} value is {1}'.format(i.to_query_string(), i.value))
    print('===============================')
    print('\n')
