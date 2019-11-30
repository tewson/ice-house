const fs = require("fs");
const { spawn } = require("child_process");

const top100Packages = fs
  .readFileSync("./top-1000")
  .toString()
  .split("\n")
  .filter(line => line.includes("https://www.npmjs.org/package"))
  .slice(0, 100)
  .map(line => {
    const { 1: packageName } = line.match(/\[([^[]+)\]/);
    return packageName;
  });

const child = spawn("npm", [
  "install",
  "--registry=http://verdaccio:4873",
  ...top100Packages
]);

child.stdout.setEncoding("utf8");
child.stdout.on("data", chunk => console.log(chunk));

child.on("close", code => {
  console.log(`child process exited with code ${code}`);
});
