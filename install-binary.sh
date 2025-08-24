path=$(cd -- $(dirname -- "${BASH_SOURCE[0]}") && pwd) 
folder=$(echo $path | awk -F/ '{print $NF}')
source $path/env

read -p "Sure? " c
case $c in y|Y) ;; *) exit ;; esac

#install binary
mkdir -p /root/nockpool
cd /root/nockpool
curl -L -o miner-launcher https://github.com/SWPSCO/nockpool-miner-launcher/releases/latest/download/miner-launcher_linux_x64
chmod +x miner-launcher

#create env
cd $path
[ -f env ] || cp env.sample env
nano env
