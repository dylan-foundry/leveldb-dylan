module: dylan-user

define library leveldb-test-suite
  use common-dylan;
  use io;
  use leveldb;
  use testworks;

  export leveldb-test-suite;
end library;

define module leveldb-test-suite
  use common-dylan, exclude: { format-to-string };
  use format;
  use leveldb;
  use testworks;

  export leveldb-test-suite;
end module;
