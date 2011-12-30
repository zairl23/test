# test object
assert = require "assert"
json = 
  "name": "Neychang"
  "age": "27"
  "num": 27
# assinment
# json.num = 28  
assert.equal("object", typeof json)
assert.equal("Neychang", json["name"])
assert.equal("Neychang", json.name)
assert.equal("27", json.age)
assert.equal(27, json.num) # after assignment assert.equal(28, json.num)
# json is a object ,key: value
# json.key == value or json[key] == value 


