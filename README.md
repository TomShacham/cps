# cps
cps is a tiny library that lifts any function into a function that takes a continuation.
e.g.  
`add1    = (x) -> x + 1`
`add1Cps = cps add1`
`add1Cps 5` => returns a function that takes a function
`add1Cps(5)((x)-> x+1)` => 6

if you want to chain together a number of cps functions then you can use 
`chain`
e.g.
`add1Cps = cps add1`
`add3Cps = chain(add1Cps, add1Cps, add1Cps)` => still only takes one callback
`eight   = add3Cps 5` => 5 gets passed into first cps function passed to `chain`
`eleven  = eight (x) -> x + 3`
