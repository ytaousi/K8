if []#nginx pid
then
    exit 1
else
    exit 0
fi

if []#php-fpm7 pid
then
    exit 1
else
    exit 0
fi