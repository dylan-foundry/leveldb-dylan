MELANGE=~/Open-Dylan/bin/melange

OPEN_DYLAN_USER_REGISTRIES = $(CURDIR)/registry

all: build

.PHONY: build test

leveldb.dylan: leveldb.intr $(MELANGE)
	$(MELANGE) -Tc-ffi -Iext/leveldb/include leveldb.intr leveldb.dylan

ext/leveldb/libleveldb.a:
	$(MAKE) -C ext/leveldb

build: leveldb.dylan ext/leveldb/libleveldb.a
	dylan-compiler -build leveldb

test: leveldb.dylan ext/leveldb/libleveldb.a
	dylan-compiler -build leveldb-test-suite-app
	~/Open-Dylan/bin/leveldb-test-suite-app
