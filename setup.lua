-- setup

package.path = "src/?.tl" .. ";" .. package.path
-- package.path = "build/?.lua" .. ";" .. package.path
-- package.cpath = "build/?.so" .. ";" .. package.cpath

-- teal embbeding
tl = require("tl")
tl.loader()
