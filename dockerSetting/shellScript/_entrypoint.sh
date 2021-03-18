#!/bin/bash
cd /var/_localApp
node test.js >> /var/_sharedFolder/output/console.log
echo "true" >> /var/_sharedFolder/ondemand_finished.data
echo '{"code" : "removeMe"}' > /var/_localAppData/commCron/removeMe.json
