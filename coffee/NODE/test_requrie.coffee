# test requrie method ,it create an object
assert = require "assert"
assert.equal("object", typeof assert)
assert.equal("function", typeof require)
#? assert.equal("", instanceof require)

http = require "http"
console.log typeof http # object

