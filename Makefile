.PHONY: clean

LUALIB = /usr/local/include
LUAJITLIB = $(LUALIB)/luajit-2.1
CFLAGS = -g -fPIC -Wall -Werror
CFLAGS_LUA = $(CFLAGS) -I/$(LUALIB)
CC=gcc

tl_run_main: build/cfactorial.so
	tl run src/main.tl

build/cfactorial.so: build/cfactorial.o
	$(CC) $(CFLAGS_LUA) -shared -o build/cfactorial.so build/cfactorial.o

build/cfactorial.o:
	$(CC) $(CFLAGS_LUA) -I$(LUAJITLIB) -c src/cfactorial.c -o build/cfactorial.o

# ----

clean:
	rm -f build/*.o build/*.so
