for f in /usr/local/WowzaStreamingEngine/content/hadn*.mp4;
do
   if [[ $f = *"ICT_2018-08-02"* ]]; then
      mv $f "/home/iot/Documents/bash_script/hadn/2018-08-02"
      echo "$f"
   fi
done
