# 1 #anonymous functions using do
console.log do -> 'Hello functions!'
# 2 #also an anonymous functions
console.log (-> 'Hello functions!')()
console.log "Hello functions!" # Hello function!
# 3 naming function
# Naming a function in CoffeeScript just means assigning it to a variable
hi = -> 'Hello functions!'
console.log hi # return "[Function]"
console.log hi() # return "Hello function!"
console.log do hi # Hello functions!
#more versatile using arguments
greeting = (subject) -> "Hello, #{subject}!"#Interpolations only work in double-quoted strings.
console.log greeting 'arguments' # string interpolation to insert an expression into a string

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

# a math function
a = (num) -> Math.pow(num, 3) # or num, 3
console.log a(3) # 27

# true or false
a = (num) -> num % 2 is 1 # is = ===
console.log a(4) # false
console.log a(3) # true
# == = is in coffeescript
a = (num) -> num % 2 == 1 # == = is = ===
console.log a(4) # false
console.log a(3) # true
# about is and ==
console.log 0 is '0' # false
console.log 0 == '0' # false
# using typeof
console.log typeof 0 # number
console.log typeof '0' #string

# To avoid confusion, I like to use parentheses for everything but the outermost
# function call:
console.log(Math.round 3.1, Math.round 5.2) # return 3
console.log Math.round 3.1, Math.round 5.2  # return 3
console.log Math.round (3.1), Math.round (5.2)  # return 3
console.log Math.round(3.1), Math.round(5.2)  # return 3 5
  

