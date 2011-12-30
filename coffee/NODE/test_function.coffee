# test function
assert = require "assert"
fun = ->
assert.equal("function", typeof fun)

json = ->
  "name": "Neychang"
  "age": "27"
  "num": 27
a = new json
assert.equal("function", typeof fun) # it's a function
#? assert.equal({"name":"Neychang", "age":"27", "num":27}, a)
assert.equal("Neychang", a.name)
assert.equal("27", a.age)
assert.equal(27, a.num)

# 匿名函数
#
b = new Object
b.attr1 -> json 
console.log b.attr1

