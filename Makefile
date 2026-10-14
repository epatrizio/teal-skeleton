.PHONY: clean

LUALIB = /usr/local/include
LUAJITLIB = $(LUALIB)/luajit-2.1
CFLAGS = -g -fPIC -Wall -Werror
CFLAGS_LUA = $(CFLAGS) -I/$(LUALIB)
CC=gcc

# ----

lua_run_tlmain: build/main_tl.lua
	cd build; lua main_tl.lua

build/main_tl.lua: build/mod_tl.lua build/mod_lua.lua build/cfactorial.so
	tl gen src/main.tl;
	mv main.lua build/main_tl.lua;

build/mod_lua.lua:
	cp src/mod_lua.lua build/mod_lua.lua;

# ----

tl_run_tlmain: build/cfactorial.so
	tl run src/main.tl

build/cfactorial.so: build/cfactorial.o
	$(CC) $(CFLAGS_LUA) -shared -o build/cfactorial.so build/cfactorial.o

build/cfactorial.o:
	$(CC) $(CFLAGS_LUA) -I$(LUAJITLIB) -c src/cfactorial.c -o build/cfactorial.o

# ----

lua_main:
	lua src/main.lua

# ----

lua_run_luamain: build/main_lua.lua
	cd build; lua main_lua.lua

build/main_lua.lua: build/mod_tl.lua
	cp src/main.lua build/main_lua.lua;
	cp setup_build.lua build/setup.lua;

build/mod_tl.lua:
	tl gen src/mod_tl.tl;
	mv mod_tl.lua build/mod_tl.lua;

# ----

clean:
	rm -f build/*.o build/*.so
	rm -f build/*.lua
