MELANGE=~/Open-Dylan/bin/melange

OPEN_DYLAN_USER_REGISTRIES = $(CURDIR)/registry

all: leveldb.dylan ext/leveldb/libleveldb.a build

.PHONY: build

leveldb.dylan: leveldb.intr
	$(MELANGE) -Tc-ffi -Iext/leveldb/include leveldb.intr leveldb.dylan

ext/leveldb/libleveldb.a:
	$(MAKE) -C ext/leveldb

build:
	dylan-compiler -build leveldb

test:
	dylan-compiler -build leveldb-test-suite-app
	~/Open-Dylan/bin/leveldb-test-suite-app
