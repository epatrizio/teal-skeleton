-- A Lua programm can load teal modules

-- teal embbeding
local tl = require("tl")
tl.loader()

-- teal module loading
local mod_tl = require("src/mod_tl")

local data_1 = mod_tl.key_1
local data_2 = mod_tl.key_2
print(data_1, data_2)   -- 1, value_2
