module: leveldb

define interface
  #include "leveldb/c.h",
    equate: {"char *" => <c-string>},
    rename: {
      "leveldb_open" => %leveldb-open,
      "leveldb_put" => %leveldb-put,
      "leveldb_delete" => %leveldb-delete,
      "leveldb_write" => %leveldb-write,
      "leveldb_get" => %leveldb-get,
      "leveldb_compact_range" => %leveldb-compact-range,
      "leveldb_destroy_db" => %leveldb-destroy-db,
      "leveldb_repair_db" => %leveldb-repair-db,
      "leveldb_iter_seek" => %leveldb-iter-seek,
      "leveldb_writebatch_put" => %leveldb-writebatch-put,
      "leveldb_writebatch_delete" => %leveldb-writebatch-delete
    };

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

  function "leveldb_destroy_db",
    output-argument: 3;

  function "leveldb_repair_db",
    output-argument: 3;

  function "leveldb_iter_key",
    output-argument: 2;

  function "leveldb_iter_value",
    output-argument: 2;

  function "leveldb_iter_valid",
    map-result: <C-boolean>;

  function "leveldb_iter_get_error",
    output-argument: 2;

  function "leveldb_options_set_create_if_missing",
    map-argument: { 2 => <C-boolean> };

  function "leveldb_options_set_error_if_exists",
    map-argument: { 2 => <C-boolean> };

  function "leveldb_options_set_paranoid_checks",
    map-argument: { 2 => <C-boolean> };
end interface;

define function leveldb-open (options :: <leveldb-options-t*>, name :: <byte-string>) => (db :: <leveldb-t*>)
  let (db, errormsg) = %leveldb-open(options, name);
  if (errormsg ~= "")
    error(errormsg);
  end;
  db
end;

define method leveldb-put (db :: <leveldb-t*>, options :: <leveldb-writeoptions-t*>, key :: <string>, data :: <string>) => ()
  let errormsg = %leveldb-put(db, options, key, key.size, data, data.size);
  /*if (errormsg ~= "")
    error(errormsg);
  end;*/
end;

define method leveldb-delete (db :: <leveldb-t*>, options :: <leveldb-writeoptions-t*>, key :: <string>) => ()
  let errormsg = %leveldb-delete(db, options, key, key.size);
  if (errormsg ~= "")
    error(errormsg);
  end;
end;

define method leveldb-write (db :: <leveldb-t*>, options :: <leveldb-writeoptions-t*>, batch :: <leveldb-writebatch-t*>) => ()
  let errormsg = %leveldb-write(db, options, batch);
  if (errormsg ~= "")
    error(errormsg);
  end;
end;

define method leveldb-get (db :: <leveldb-t*>, options :: <leveldb-readoptions-t*>, key :: <string>)
  let (data, length, errormsg) = %leveldb-get(db, options, key, key.size);
  /*if (errormsg ~= "")
    error(errormsg);
  end;*/
  data
end;

define function leveldb-compact-range (db :: <leveldb-t*>, start-key :: <string>, limit-key :: <string>) => ()
  %leveldb-compact-range(db, start-key, start-key.size, limit-key, limit-key.size)
end;

define function leveldb-destroy-db (options :: <leveldb-options-t*>, name :: <byte-string>)
  let errormsg = %leveldb-destroy-db(options, name);
  if (errormsg ~= "")
    error(errormsg);
  end;
end;

define function leveldb-repair-db (options :: <leveldb-options-t*>, name :: <byte-string>)
  let errormsg = %leveldb-repair-db(options, name);
  if (errormsg ~= "")
    error(errormsg);
  end;
end;

define method leveldb-iter-seek (iter :: <leveldb-iterator-t*>, key :: <string>) => ()
  %leveldb-iter-seek(iter, key, key.size)
end;

define method leveldb-writebatch-put (batch :: <leveldb-writebatch-t*>, key :: <string>, val :: <string>)
  %leveldb-writebatch-put(batch, key, key.size, val, val.size);
end;

define method leveldb-writebatch-delete (batch :: <leveldb-writebatch-t*>, key :: <string>)
  %leveldb-writebatch-delete(batch, key, key.size);
end;
