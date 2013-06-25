module: leveldb-test-suite
synopsis: Test suite for the leveldb library.

define suite leveldb-test-suite ()
  test basic-leveldb-test;
end suite;

define test basic-leveldb-test ()
  let options = leveldb-options-create();
  leveldb-options-set-create-if-missing(options, #t);
  let db = leveldb-open(options, "test.db");
  let writeoptions = leveldb-writeoptions-create();
  check-no-condition("Can write to the database as buffer",
                     leveldb-put(db, writeoptions, "somekey1", as(<buffer>, "HALP1")));
  check-no-condition("Can write to the database as byte-vector",
                     leveldb-put(db, writeoptions, "somekey2", as(<byte-vector>, "HALP2")));
  check-no-condition("Can write to the database as string",
                     leveldb-put(db, writeoptions, "somekey3", "HALP3"));
  let readoptions = leveldb-readoptions-create();
  check-equal("Can read from the database",
              as(<byte-vector>, "HALP1"),
              leveldb-get(db, readoptions, "somekey1"));
  check-equal("Can read from the database",
              as(<byte-vector>, "HALP2"),
              leveldb-get(db, readoptions, "somekey2"));
  check-equal("Can read from the database",
              as(<byte-vector>, "HALP3"),
              leveldb-get(db, readoptions, "somekey3"));
  leveldb-writeoptions-destroy(writeoptions);
  leveldb-readoptions-destroy(readoptions);
  leveldb-close(db);
  leveldb-options-destroy(options);
end test basic-leveldb-test;
