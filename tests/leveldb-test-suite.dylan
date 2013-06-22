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
  check-no-condition("Can write to the database",
                     leveldb-put(db, writeoptions, "somekey", as(<buffer>, "HALP")));
  let readoptions = leveldb-readoptions-create();
  check-equal("Can read from the database",
              "HALP",
              leveldb-get(db, readoptions, "somekey"));
  leveldb-writeoptions-destroy(writeoptions);
  leveldb-readoptions-destroy(readoptions);
  leveldb-close(db);
  leveldb-options-destroy(options);
end test basic-leveldb-test;
