module: leveldb

define interface
  #include "leveldb/c.h";

  function "leveldb_open",
    output-argument: 3;

  function "leveldb_put",
    output-argument: 7;

  function "leveldb_delete",
    output-argument: 5;

  function "leveldb_write",
   output-argument: 4;

  function "leveldb_get",
    output-argument: 5,
    output-argument: 6;

  function "leveldb_iter_valid",
    map-result: <boolean>;

  function "leveldb_options_set_create_if_missing",
    map-argument: { 2 => <boolean> };

  function "leveldb_options_set_error_if_exists",
    map-argument: { 2 => <boolean> };

  function "leveldb_options_set_paranoid_checks",
    map-argument: { 2 => <boolean> };
end interface;
