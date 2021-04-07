const process = require('process');
const fs = require('fs');

const inDataFn = '/var/_sharedFolder/input/input.Data';

console.log('runing start -> ' + new Date());

const makeid = (length) => {
  var result           = '';
  var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  var charactersLength = characters.length;
  for ( var i = 0; i < length; i++ ) {
     result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }
  return result;
}

setTimeout(
  ()=> {
    fs.readFile(inDataFn, 'utf-8', (err, data) =>{
      console.log(data + '-->' + new Date());
      for (var i=0; i < 10; i++) {
        console.log(makeid(32));
      }
      console.log('runing end -> ' + new Date());
    })
    
  }, 60000
);