# the name's the same
x = 5
triple = (x) -> x *= 3
console.log triple x # return 15
console.log x # return 5

# 
age = 5
nianlin = -> age = 0
console.log age # 5

#
age = 5
nianlin = -> age = 0
nianlin()
console.log age # 0

#
nianlin = -> age = 0
age = 5
nianlin()
console.log age # 0

#
nianlin = -> age = 0
nianlin()
age = 5
console.log age # 5

#
nianlin = -> age = 0
nianlin()
console.log age # 0
console.log "age = #{age}" # age = 0

