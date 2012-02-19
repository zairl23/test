a = new String

console.log typeof a # object,isn't string
console.log typeof String # function
console.log typeof string # undefined, should upcase

a = 1
console.log a # 1,can assign tu number even creted by String
console.log a.length # undefined ,is a Number

a = "coffee"
console.log a.length # 6
console.log a.charAt(0) # c
console.log a.charAt(-1) # null
console.log a.charAt(5) # e
console.log a.charCodeAt(0) # 99
console.log a.toUpperCase() # COFFEE
console.log a.toUpperCase #  [Function: toUpperCase]
console.log a.slice(0,a.length) # coffee
console.log a.slice(1,(a.length))# offee
console.log a.slice(2,(a.length)) # 







