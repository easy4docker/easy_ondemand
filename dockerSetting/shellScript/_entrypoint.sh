#!/bin/bash
cd /var/_localApp
echo $mainIP >> /var/_shareFolder/mainIP.txt
node test.js >> /var/_shareFolder/easy_ondemand.txt
#curl -d "data=@/var/_shareFolder/easy_ondemand.txt" localhost/postFile
cp /var/shellScript/removeMe.json /var/_localAppData/commCron/
