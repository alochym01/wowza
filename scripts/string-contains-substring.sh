for f in /usr/local/WowzaStreamingEngine/content/*.mp4;
do
   #echo "$f"
   if [[ $f = *"720p_2018-07-25"* ]]; then
      echo "$f"
   fi
done
