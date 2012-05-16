library:      leveldb
target-type:  dll
license:      See License.txt in this distribution for details.
warranty:     Distributed WITHOUT WARRANTY OF ANY KIND
files:        library
              leveldb
c-header-files: ext/leveldb/libleveldb.a
c-libraries:  libleveldb.a
              -lsnappy
              -lstdc++
