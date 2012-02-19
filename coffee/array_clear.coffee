clearArray = (array) ->
  array.splice 0, array.length
  
a = [1,2,3]
#console.log [1,2,3].clearArray()
console.log clearArray a  # [1,2,3]
console.log a # []

# return []
clearArray = (array) ->
  array.splice 0, array.length
  array
a = [1,2,3]
#console.log [1,2,3].clearArray()
console.log clearArray a  # []


clearArray = (array) ->
  array.splice 0, array.length
  true
a = [1,2,3]
#console.log [1,2,3].clearArray()
console.log clearArray a  # true ? how return nothing
