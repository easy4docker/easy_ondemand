#!/bin/bash
cd /var/_localApp
# echo $mainIP >> /var/_shareFolder/mainIP.txt
node test.js >> /var/_shareFolder/easy_ondemand.txt
# upload all file within /var/_shareFolder
if [ $onDemandCallbackHost = "localhost" ]; then
  goalHost=${mainIP}:10000
else
  goalHost=${onDemandCallbackHost}
fi
echo "callbackHost: "$onDemandCallbackHost > /var/_shareFolder/config.txt
echo "superPowerServer: "$superPowerServer >> /var/_shareFolder/config.txt
echo "goalHost: "$goalHost >> /var/_shareFolder/config.txt

curl -F "objPath=/var/_localAppData/sitesShareFolder/${superPowerServer}/gridCollection" $(find /var/_shareFolder/ -name '*' -type f -exec echo -n -F "file=@{} " \;) ${goalHost}/upload > /var/_shareFolder/SB.txt
cp /var/shellScript/removeMe.json /var/_localAppData/commCron/
