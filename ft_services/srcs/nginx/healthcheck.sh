if []#nginx pid
then
    exit 1
else
    exit 0
fi

if []#sshd pid
then
    exit 1
else
    exit 0
fi