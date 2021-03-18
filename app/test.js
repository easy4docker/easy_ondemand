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
const fn = '/var/_sharedFolder/input/inputData.data';
// const fn = __dirname + '/data.data'
const fs = require('fs');
fs.readFile(fn, 'utf-8', (err, data) => {
  console.log('start');

  try {
    console.log('start 2');
    const list = data.split('\n');
    console.log('start');
    for (let i =0; i < list.length; i++) {
      console.log(i + ':' + list[i]);
    }
    console.log('end');
  } catch (e) {
    console.log(e.message);
  }
  console.log('end2');
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
