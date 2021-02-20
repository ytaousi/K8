
#mkdir -p /goinfre/${USER}/k8


export MINIKUBE_HOME=/goinfre/${USER}/k8
export MINIKUBE_PATH=/goinfre/${USER}/brew/bin/minikube

if [! -d "/goinfre/${USER}/brew"]
then
    echo "Okkk"#git clone https://github.com/Homebrew/brew.git /goinfre/${USER};

fi

if [! -f "/goinfre/${USER}/brew/bin/docker"]
then
    echo "Okkk"#brew install docker;
fi

if [! -f "/goinfre/${USER}/brew/bin/minikube"]
then
    echo "OKkk";#brew install minikube;
fi

sh ./srcs/setup.sh
