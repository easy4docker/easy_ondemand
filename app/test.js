/*
const fs = require('fs');
const request = require('request');
request('http://www.google.com', function (error, response, body) {
  console.error('error:', error); // Print the error if one occurred
  console.log('statusCode:', response && response.statusCode); // Print the response status code if a response was received
  console.log('body:', body); // Print the HTML for the Google homepage.
});
*/
// '/var/_sharedFolder/input/inputData.data'
const fs = require('fs');
fs.readFile('/var/_sharedFolder/input/inputData.data', 'utf-8', (err, data) => {
  const list = data.split("\n");
  for (let i =0; i < list.length; i++) {
    console.log(list[i]);
  }
});
/*
fs.readDir
const process = require('process');
console.log('runing start -> ' + new Date());

setInterval(()=> {
  console.log('.. ' + new Date());
}, 5000)

setTimeout(
  ()=> {
    console.log('runing end -> ' + new Date());
    process.exit()
  }, 60000
);
*/
