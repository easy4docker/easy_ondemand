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
