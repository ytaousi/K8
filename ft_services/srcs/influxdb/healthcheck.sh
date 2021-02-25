if []#influxd pid
then
    exit 1
else
    exit 0
fi

if []#telegraf pid
then
    exit 1
else
    exit 0
fi