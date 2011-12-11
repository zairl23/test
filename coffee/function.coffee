# 1 #anonymous functions using do
console.log do -> 'Hello functions!'
# 2 #also an anonymous functions
console.log (-> 'Hello functions!')()
#3 naming function
hi = -> 'Hello functions!'
console.log hi #return "[Function]"
console.log hi() #return "Hello function!"

#more versatile using arguments
greeting = (subject) -> "Hello, #{subject}!"#Interpolations only work in double-quoted strings.
console.log greeting 'arguments'
#return Hello, arguments!

# offeeScript’s + operator is sensitive to whitespace
a = 'red'
b = a + 5 #not a +5
console.log b # return "red5"
#d = a +5
#console.log d # TypeError: string is not a function
   # at String.CALL_NON_FUNCTION (native)
   # at Object.<anonymous> (/home/ney/test/coffee/function.coffee:21:7)
   # at Object.<anonymous> (/home/ney/test/coffee/function.coffee:25:4)
   # at Module._compile (module.js:425:26)
e = a+ 5
console.log e # return "red5"
c = a+5 
console.log c  # return "red5"

# To avoid confusion, I like to use parentheses for everything but the outermost
# function call:
console.log(Math.round 3.1, Math.round 5.2) # return 3
console.log Math.round 3.1, Math.round 5.2  # return 3
console.log Math.round (3.1), Math.round (5.2)  # return 3
console.log Math.round(3.1), Math.round(5.2)  # return 3 5
  

