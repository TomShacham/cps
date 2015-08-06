{cps} = require '../src/cps'

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
