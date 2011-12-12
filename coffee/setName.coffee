setName = (name) -> @name = name
# @name shorthand for this.name

cat = {}
cat.setName = setName
cat.setName 'me'
console.log cat.name # returne me

# apply
pig = {}
setName.apply pig, ['Babe']
console.log pig.name # return Babe

# same to apply using call
setName.call pig, 'Baby'
console.log pig.name # return Baby

# You can use call and apply to “borrow” one object’s methods and use them
# on another:
horse = {}
cat.setName.apply horse, ['Mr. Ed']
console.log horse.name # return Mr Ed
cat.setName.apply horse
console.log horse.name # undefined

# a new object using the function as a constructor
Dog = setName # By convention, constructors are capitalized
dog1 = new Dog('Jimmy')
dog2 = new Dog('Jake')
console.log dog1.name # 'Jimmy'
console.log dog2.name # 'Jake'
