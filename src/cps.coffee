id = (x) -> x

cps = (f) -> (args...) -> (h) -> h f.apply(this, args)

chain = (funcs...) -> (args...) -> (f) ->
	f funcs.reduce (acc, func) ->
		acc = func(acc)(id)
	, funcs.shift().apply(this, args)(id)



module.exports = {
	cps: cps
	chain: chain
} 

