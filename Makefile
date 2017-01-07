OS := $(shell uname)

SRC := entities.c
OBJ := $(SRC:.c=.o)

DEMO := demo

ifeq ($(OS), Darwin)
SO_NAME := libhtmlentities.dylib
else
SO_NAME := libhtmlentities.so
endif

CFLAGS := -Wall -O3 -flto -g -fPIC -MMD

ifeq ($(OS), Linux)
    CFLAGS := $(CFLAGS) -Wl,--build-id
endif

PREFIX := /usr/local
LUA_VERSION = 5.1
SO_TARGET_DIR := $(PREFIX)/lib/lua/$(LUA_VERSION)
LUA_TARGET_DIR := $(PREFIX)/share/lua/$(LUA_VERSION)/

.PHONY = all test clean install

all : $(SO_NAME)

${OBJ} : %.o : %.c
	$(CC) $(CFLAGS) -DBUILDING_SO -c $<

${SO_NAME} : ${OBJ}
	$(CC) $(CFLAGS) -DBUILDING_SO $^ -shared -o $@

test:
	luajit test.lua

clean:
	rm -f *.o *.so a.out *.d

install:
	install -D -m 755 $(SO_NAME) $(DESTDIR)/$(SO_TARGET_DIR)/$(SO_NAME)
	install -D -m 664 htmlentities.lua  $(DESTDIR)/$(LUA_TARGET_DIR)/htmlentities.lua
