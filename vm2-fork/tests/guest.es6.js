var fs = require('fs');
console.log(`${process.pid}: fs.readFileSync(hello.txt) => ${fs.readFileSync('hello.txt')}`);

fs.readFile('aaa.txt', (err, buffer) => {
    if (err) {
        console.log(`${process.pid}: inside callback: err = ${err}`);
        console.dir(err);
    }
    console.log(`${process.pid}: inside callback: buffer = ${buffer}`);
});
