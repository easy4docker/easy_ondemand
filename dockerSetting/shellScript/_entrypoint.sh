#!/bin/bash
cd /var/_localApp
echo $mainIP >> /var/_shareFolder/mainIP.txt
node test.js >> /var/_shareFolder/easy_ondemand.txt
# upload all file within /var/_shareFolder
if [ $onDemandCallbackHost = "localhost" ]; then
  goalHost=${mainIP}:10000
else
  goalHost=${onDemandCallbackHost}
fi
echo $onDemandCallbackHost >> /var/_shareFolder/onDemandCallbackHost.txt
echo $superPowerServer >> /var/_shareFolder/superPowerServer.txt
echo $goalHost >> /var/_shareFolder/goalHost.txt

curl -F "objPath=/var/_localAppData/sitesShareFolder/${superPowerServer}/_shareMain" $(find /var/_shareFolder/ -name '*' -type f -exec echo -n -F "file=@{} " \;) ${goalHost}/upload > /var/_shareFolder/SB.txt
cp /var/shellScript/removeMe.json /var/_localAppData/commCron/
