# In JavaScript, every object is a hash
assert = require "assert"

a = new Object
b = {} # it,s same equal
console.log typeof Object # function
console.log typeof a # object
console.log typeof b # object
#assert.equal(a, b)
# In JSON, objects are denoted by {}, arrays by []. Note that JSON is a subset
# of JavaScript and can usually be pasted directly into CoffeeScript code.

# There are two ways of accessing object properties: dot notation and bracket
# notation.
# So obj['x'] is always equivalent to obj.x
# JSON style create
i =
  name: "ney"
  age: 27
  parents:
    father: "tom"
    mom: "yun"
  sister:
    name: "huan"
    age: 20
    
# access to i 
console.log i.name # ney
console.log i["name"] # ney should add ""
console.log i.parents # { father: 'tom', mom: 'yun' }
console.log i.parents.mom # yun
console.log typeof i.parents.mom # string



