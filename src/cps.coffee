exports.cps = cps = (f) -> (args...) -> (h) -> h f.apply(this, args)

