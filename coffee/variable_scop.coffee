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

ney =
  name: "chang"
  des: () ->
    return this.name
b = {}    
b = ney.des
b.call name: "chances" 
zhang = 
  des: ney.des
  name: "lei"  
    
a = new Object(ney)
console.log b, typeof ney.des # [Fuction], 'fuction'
console.log a.name, a.des() # return chang chang
console.log zhang.name, zhang.des() # lei lei




