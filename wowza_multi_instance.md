# Installation Wowza
1. Download Wowza software from [wowza.com](https://www.wowza.com/pricing/installer)
2. Installation Wowza successfull
3. Copy Wowza root folder `WowzaStreamingEngine` to new folder `WowzaStreamingEngine01`
    - Create folder Wowza instance 01
    
          mkdir WowzaStreamingEngine_01
    
    - Copy all Wowza folder's instance to new `WowzaStreamingEngine_01` and exclude `*.mp4` files
    
          rsync -av --exclude '*.mp4' WowzaStreamingEngine-4.7.5 WowzaStreamingEngine_01
    - `cd WowzaStreamingEngine_01`
    - `mv WowzaStreamingEngine-4.7.5/* .`
4. Copy and Edit some files
    - rename
      - `/usr/local/WowzaStreamingEngine-4.7.5_01/bin/WowzaStreamingEngine.service` => `/usr/local/WowzaStreamingEngine-4.7.5_01/bin/WowzaStreamingEngine_01.service`
    - edit `/usr/local/WowzaStreamingEngine-4.7.5_01/bin/WowzaStreamingEngine_01.service`
          
          [Unit]
          Description=WowzaStreamingEngine 01
          After=syslog.target
          After=network.target
          After=local-fs.target
          After=remote-fs.target
          
          [Service]
          Type=simple
          User=root
          Group=root
          ExecStart=/usr/local/WowzaStreamingEngine-4.7.5_01/bin/systemd.sh start
          RemainAfterExit=yes
          TimeoutSec=300
          
          [Install]
          WantedBy=multi-user.target

    - copy
          
          cp -f /usr/local/WowzaStreamingEngine-4.7.5_01/bin/WowzaStreamingEngine_01.service /usr/lib/systemd/system
    - `/usr/local/WowzaStreamingEngine-4.7.5_01/conf/VHost.xml`
    - `/usr/local/WowzaStreamingEngine-4.7.5_01/conf/Server.xml`    
