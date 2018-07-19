#https://www.wowza.com/docs/how-to-use-jconsole-with-wowza-media-server#remoteJMXConfigObjectList
from jmxquery import JMXConnection, JMXQuery

jmx = JMXConnection("service:jmx:rmi://localhost:8084/jndi/rmi://localhost:8085/jmxrmi",jmx_username="admin", jmx_password="admin", java_path="/usr/local/WowzaStreamingEngine/java/bin/java")

vhost_obj = [
	"WowzaStreamingEngine:vHosts=*,vHostName=*,name=*",
	"WowzaStreamingEngine:vHosts=*,vHostName=*,idleWorkers=*,idleWorker=*",
	"WowzaStreamingEngine:vHosts=*,vHostName=*,streamTypes=*,streamTypeName=*,name=*"
]
#with open("WowzaStreamingEngine_properties.txt", "w") as f:
for obj in vhost_obj:
    #wowza_object = jmx.query([JMXQuery("WowzaStreamingEngine:vHosts=*,vHostName=*,name=*")])
    wowza_object = jmx.query([JMXQuery(obj)])
    #with open("WowzaStreamingEngine_properties.txt", "w") as f:
    for i in wowza_object:
        print(i.to_string())
    print('===============================')
    print('\n')
        #print('{0} value is {1}'.format(i.to_query_string(), i.value))
        #f.write(i.to_string() + "\n")
