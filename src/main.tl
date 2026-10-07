local function fact(n : integer) : integer
    -- not useful: n runtime type-ckecking (~! lua)
    assert(n >= 0, "integer must be positive")
    if n == 0 then
        return 1
    else
        return n * fact(n - 1)
    end
end

print(fact(5))      -- 120
-- print(fact(5.5)) -- typing error: got number, expected integer

-- Teal module

local mod_tl = require("mod_tl")

local data_1 : integer = mod_tl.key_1
local data_2 : string = mod_tl.key_2
print(data_1, data_2)

-- Lua module

local mod_lua = require("mod_lua")  -- no type information for required module: 'mod_lua':
                                    --   https://teal-language.org/book/latest/declaration_files.html
                                    --   add declaration file mod_lua.d.tl (~ types interface lua/teal module)
data_1 = mod_lua.key_1
data_2 = mod_lua.key_2
print(data_1, data_2)

-- Lua C module

local factorial = require("cfactorial")     -- cfactorial.d.tl type_interface
print(factorial.fact(5))
