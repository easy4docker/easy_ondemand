#!/bin/bash
cd /var/_localApp
node test.js >> /var/_shareFolder/output/console.log
echo "true" >> /var/_shareFolder/ondemand_finished.data
echo '{"code" : "removeMe"}' > /var/_localAppData/commCron/removeMe.json
