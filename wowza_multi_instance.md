# Installation Wowza on CentOS 7
1. Download Wowza software from [wowza.com](https://www.wowza.com/pricing/installer)
2. Installation Wowza successfull
3. Copy Wowza root folder `WowzaStreamingEngine` to new folder `WowzaStreamingEngine01`
    - Create folder Wowza instance 01
    
          mkdir WowzaStreamingEngine-4.7.5_01
    
    - Copy all Wowza folder's instance to new `WowzaStreamingEngine_01` and exclude `*.mp4` files
    
          rsync -av --exclude '*.mp4' WowzaStreamingEngine-4.7.5 WowzaStreamingEngine-4.7.5_01
    - `cd WowzaStreamingEngine-4.7.5_01`
    - `mv WowzaStreamingEngine-4.7.5/* .`
4. Copy and Edit some files
    - rename
      - `/usr/local/WowzaStreamingEngine-4.7.5_01/bin/WowzaStreamingEngine.service` => `/usr/local/WowzaStreamingEngine-4.7.5_01/bin/WowzaStreamingEngine_01.service`
    - edit `/usr/local/WowzaStreamingEngine-4.7.5_01/bin/WowzaStreamingEngine_01.service` and [content of file](https://raw.githubusercontent.com/alochym01/wowza/master/WowzaStreamingEngine_01.service)
    - copy
          
          cp -f /usr/local/WowzaStreamingEngine-4.7.5_01/bin/WowzaStreamingEngine_01.service /usr/lib/systemd/system
          
    - edit `/usr/local/WowzaStreamingEngine-4.7.5_01/bin/systemd.sh` and [content of file](https://raw.githubusercontent.com/alochym01/wowza/master/systemd.sh)
    - edit `/usr/local/WowzaStreamingEngine-4.7.5_01/bin/setenv.sh` and [content of file](https://raw.githubusercontent.com/alochym01/wowza/master/setenv.sh)
    - edit file `/usr/local/WowzaStreamingEngine-4.7.5_01/bin/wms.sh` and [content of file](https://raw.githubusercontent.com/alochym01/wowza/master/wms.sh)
    - edit file `/usr/local/WowzaStreamingEngine-4.7.5_01/bin/tune.sh` and [content of file](https://raw.githubusercontent.com/alochym01/wowza/master/tune.sh)
    - edit file `/usr/local/WowzaStreamingEngine-4.7.5_01/bin/ldpreload.sh` and [content of file](https://raw.githubusercontent.com/alochym01/wowza/master/ldpreload.sh)
    - rename `WowzaStreamingEngine` to `WowzaStreamingEngine-01` edit file `/usr/local/WowzaStreamingEngine-4.7.5_01/bin/WowzaStreamingEngine-01` and [content of file](https://raw.githubusercontent.com/alochym01/wowza/master/WowzaStreamingEngine)
    - rename `WowzaStreamingEngined` to `WowzaStreamingEngined-01`    
    - edit file`/usr/local/WowzaStreamingEngine-4.7.5_01/conf/VHost.xml`
        
            <HostPortList>
			    <HostPort>
                    ...
    				<Port>11935</Port>
                <!-- Admin HostPort -->
			    <HostPort>
                    ...
    				<Port>18086</Port>
   
    - edit file `/usr/local/WowzaStreamingEngine-4.7.5_01/conf/Server.xml`    

		    <!-- JMXUrl: service:jmx:rmi://localhost:8084/jndi/rmi://localhost:8085/jmxrmi -->
		    <JMXRemoteConfiguration>
                ...
			    <RMIConnectionPort>18084</RMIConnectionPort>
			    <RMIRegistryPort>18085</RMIRegistryPort>
