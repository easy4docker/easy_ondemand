#!/bin/bash
cd /var/_localApp
node test.js >> /var/_shareFolder/easy_ondemand.txt
echo "true" >> /var/_shareFolder/ondemand_finished.data
echo '{"code" : "removeMe"}' > /var/_localAppData/commCron/removeMe.json
