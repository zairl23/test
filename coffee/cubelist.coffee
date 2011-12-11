cube = (num) -> Math.pow num, 3

list = [1,2,3,4,5]

cubelist = (cube num for num in list)
# [ 1, 8, 27, 64, 125 ]

console.log cubelist
