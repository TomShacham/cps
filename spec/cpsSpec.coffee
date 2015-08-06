Cps = require '../src/cps'
cps = Cps.cps
chain = Cps.chain

describe 'cps', ->
	it 'works with unary functions', ->
		add1 = (x) -> x + 1
		cpsAdd1 = cps(add1)
		expect(cpsAdd1(0)((x) -> x + 1)).toEqual(2)
	it 'and binary functions', ->
		binaryFunction = (x, y) -> x + y
		cpsFun = cps(binaryFunction)
		expect(cpsFun(1,2)((x)-> x + 1)).toEqual(4)
	it 'and ternary functions', ->
		ternaryFunction = (x,y,z) -> x + y + z
		cpsFun = cps(ternaryFunction)
		expect(cpsFun(1,2,3)((x)->x+1)).toEqual(7)

describe 'chaining cps functions', ->
	it 'chaining one function works as normal cps function', ->
		add1Cps = cps (x)->x+1
		expect(chain(add1Cps)(0)((x)->x+1)).toEqual(2)
	it 'passes the result of one function into the next', ->
		add1Cps = cps (x) -> x + 1
		add2Cps = cps (x) -> x + 2
		add3Cps = chain(add1Cps, add2Cps)
		expect(add3Cps(1)((x)-> x + 1)).toEqual(5)
	it 'chains as many functions together as you want', ->
		add1Cps = cps (x) -> x + 1
		add2Cps = cps (x) -> x + 2
		add3Cps = cps (x) -> x + 3
		add4Cps = cps (x) -> x + 4
		add5Cps = cps (x) -> x + 5
		add15Cps= chain(add1Cps,add2Cps,add3Cps,add4Cps,add5Cps)
		expect(add15Cps(0)((x)->x+1)).toEqual(16)














