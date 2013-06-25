module: leveldb-test-suite
synopsis: Test suite for the leveldb library.

define suite leveldb-test-suite ()
  test basic-leveldb-test;
  test writebatching-leveldb-test;
  test iterator-leveldb-test;
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

define test writebatching-leveldb-test ()
  let options = leveldb-options-create();
  leveldb-options-set-create-if-missing(options, #t);
  let db = leveldb-open(options, "test.db");
  let batch = leveldb-writebatch-create();
  check-no-condition("Can write to batch as buffer",
                     leveldb-writebatch-put(batch, "batchkey1", as(<buffer>, "BATCH1")));
  check-no-condition("Can write to batch as byte-vector",
                     leveldb-writebatch-put(batch, "batchkey2", as(<byte-vector>, "BATCH2")));
  check-no-condition("Can write to batch as string",
                     leveldb-writebatch-put(batch, "batchkey3", "BATCH3"));
  let writeoptions = leveldb-writeoptions-create();
  leveldb-write(db, writeoptions, batch);
  let readoptions = leveldb-readoptions-create();
  check-equal("Can read (batch) from the database 1",
              as(<byte-vector>, "BATCH1"),
              leveldb-get(db, readoptions, "batchkey1"));
  check-equal("Can read (batch) from the database 2",
              as(<byte-vector>, "BATCH2"),
              leveldb-get(db, readoptions, "batchkey2"));
  check-equal("Can read (batch) from the database 3",
              as(<byte-vector>, "BATCH3"),
              leveldb-get(db, readoptions, "batchkey3"));
  leveldb-writeoptions-destroy(writeoptions);
  leveldb-readoptions-destroy(readoptions);
  leveldb-close(db);
  leveldb-options-destroy(options);
end test writebatching-leveldb-test;

define test iterator-leveldb-test ()
  let options = leveldb-options-create();
  leveldb-options-set-create-if-missing(options, #t);
  let db = leveldb-open(options, "test.db");
  let writeoptions = leveldb-writeoptions-create();
  leveldb-put(db, writeoptions, "aaaaaaa", "first key value");
  leveldb-put(db, writeoptions, "zzzzzzz", "last key value");
  let readoptions = leveldb-readoptions-create();
  let iter = leveldb-create-iterator(db, readoptions);
  leveldb-iter-seek-to-first(iter);
  check-equal("first iter is valid",
              #t,
              leveldb-iter-valid(iter));
  check-equal("first iter returns correct key",
              "aaaaaaa",
              leveldb-iter-key(iter));
  check-equal("first iter returns correct value",
              as(<byte-vector>, "first key value"),
              leveldb-iter-value(iter));
  leveldb-iter-seek-to-last(iter);
  check-equal("last iter is valid",
              #t,
              leveldb-iter-valid(iter));
  check-equal("last iter returns correct key",
              "zzzzzzz",
              leveldb-iter-key(iter));
  check-equal("last iter returns correct value",
              as(<byte-vector>, "last key value"),
              leveldb-iter-value(iter));
  leveldb-iter-next(iter);
  check-equal("last + next iter is not valid",
              #f,
              leveldb-iter-valid(iter));
  leveldb-writeoptions-destroy(writeoptions);
  leveldb-readoptions-destroy(readoptions);
  leveldb-close(db);
  leveldb-options-destroy(options);
end test iterator-leveldb-test;
