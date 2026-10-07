#include "assert.h"

#include "lua.h"
#include "lauxlib.h"

// #include "luajit.h"

long fact(long n)
{
    assert(n >= 0);

    if (n == 0)
        return 1;
    else
        return n * fact(n - 1);
}

int lua_fact(lua_State *L)
{
    lua_Integer n = luaL_checkinteger(L, 1);
    lua_pushinteger(L, fact(n));
    return 1;
}

static luaL_Reg const factorial_c_lib[] = {
    {"fact", lua_fact},
    {NULL, NULL}
};

// #ifndef FACTORIAL_C_API
// #define FACTORIAL_C_API
// #endif

// FACTORIAL_C_API luaopen_cfactorial(lua_State *L)
/*LUAMOD_API*/ int luaopen_cfactorial(lua_State *L)
{
    // luaopen_**cfactorial** > require("cfactorial")
    luaL_newlib(L, factorial_c_lib);
    return 1;
}
