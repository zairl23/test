odd = (num) ->
  unless typeof num is 'number'
    throw "#{num} is not a number"
  unless num is Math.round num
    throw "#{num} is not an integer"
  unless num > 0
    throw "#{num} is not positive"

