MELANGE=melange

all: build

.PHONY: build test

UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
  CFLAGS="-arch i386 -arch x86_64 -O2 -DNDEBUG"
endif
ifeq ($(UNAME), Linux)
  CFLAGS="-fPIC -O2 -DNDEBUG"
endif

leveldb.dylan: leveldb.intr ext/leveldb/include/leveldb/c.h
	$(MELANGE) -Tc-ffi -Iext/leveldb/include -I/usr/lib/clang/4.1/include/ -I/usr/include leveldb.intr leveldb.dylan

ext/leveldb/libleveldb.a:
	$(MAKE) -C ext/leveldb OPT=$(CFLAGS) libleveldb.a

build: leveldb.dylan ext/leveldb/libleveldb.a
	dylan-compiler -build leveldb

test: leveldb.dylan ext/leveldb/libleveldb.a
	dylan-compiler -build leveldb-test-suite-app
	_build/bin/leveldb-test-suite-app

clean-leveldb:
	$(MAKE) -C ext/leveldb clean

clean-dylan:

clean: clean-leveldb clean-dylan
