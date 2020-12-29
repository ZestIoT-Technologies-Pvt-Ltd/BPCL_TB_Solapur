
cd /home/smartcow/BPCL/

end_time=$(jq '.End_time' video_config.json | tr -d \")
start_time=$(jq '.Start_time' video_config.json| tr -d \")
end=$(date -d $end_time +%s)
start=$(date -d $start_time +%s)
now=$(date +%s)
Process1=$(pgrep -f -x "python3 video_5.py")
if [ $now -gt $start -a $now -lt $end ]
then
        echo "start"
        if [ ! -z "$Process1" -a "$Process1" != "" ]; then
                echo "BPCL program is running"
        else
                kill -9 $Process1
                echo "Starting BPCL process"
                python3 video_5.py
        fi
else
        echo "stop"
        if [ ! -z "$Process1" -a "$Process1" != "" ]; then
                echo "killing the running process"
                kill -9 $Process1
        fi

fi
