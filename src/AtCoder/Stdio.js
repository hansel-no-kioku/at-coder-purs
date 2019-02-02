// AtCoder.Stdio

var fs = require("fs");

exports.stdin = function(f) {
  return function() {
    return f(fs.readFileSync("/dev/stdin", "utf8"))();
  };
};
