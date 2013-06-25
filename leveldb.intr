module: leveldb
synopsis: generated bindings for the leveldb library
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define simple-C-mapped-subtype <C-buffer-offset> (<C-void*>)
  export-map <machine-word>, export-function: identity;
end;

// Function for adding the base address of the repeated slots of a <buffer>
// to an offset and returning the result as a <machine-word>.  This is
// necessary for passing <buffer> contents across the FFI.

define inline function buffer-offset
    (the-buffer, data-offset :: <integer>)
 => (result-offset :: <machine-word>)
  u%+(data-offset,
      primitive-wrap-machine-word
        (primitive-repeated-slot-as-raw
           (the-buffer, primitive-repeated-slot-offset(the-buffer))))
end function;

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
      "leveldb_iter_key" => %leveldb-iter-key,
      "leveldb_iter_seek" => %leveldb-iter-seek,
      "leveldb_iter_value" => %leveldb-iter-value,
      "leveldb_writebatch_put" => %leveldb-writebatch-put,
      "leveldb_writebatch_delete" => %leveldb-writebatch-delete
    };

  function "leveldb_open",
    output-argument: 3;

  function "leveldb_put",
    map-argument: { 5 => <C-buffer-offset> },
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

  function "leveldb_writebatch_put",
    map-argument: { 4 => <C-buffer-offset> };

  function "leveldb_options_set_create_if_missing",
    map-argument: { 2 => <C-boolean> };

  function "leveldb_options_set_error_if_exists",
    map-argument: { 2 => <C-boolean> };

  function "leveldb_options_set_paranoid_checks",
    map-argument: { 2 => <C-boolean> };
end interface;

define function leveldb-open (options :: <leveldb-options-t*>, name :: <byte-string>) => (db :: <leveldb-t*>)
  let (db, errormsg) = %leveldb-open(options, name);
  unless (null-pointer?(errormsg))
    error(errormsg);
  end;
  db
end;

define method leveldb-put (db :: <leveldb-t*>, options :: <leveldb-writeoptions-t*>, key :: <string>, data) => ()
  let errormsg = %leveldb-put(db, options, key, key.size, buffer-offset(data, 0), data.size);
  unless (null-pointer?(errormsg))
    error(errormsg);
  end;
end;

define method leveldb-delete (db :: <leveldb-t*>, options :: <leveldb-writeoptions-t*>, key :: <string>) => ()
  let errormsg = %leveldb-delete(db, options, key, key.size);
  unless (null-pointer?(errormsg))
    error(errormsg);
  end;
end;

define method leveldb-write (db :: <leveldb-t*>, options :: <leveldb-writeoptions-t*>, batch :: <leveldb-writebatch-t*>) => ()
  let errormsg = %leveldb-write(db, options, batch);
  unless (null-pointer?(errormsg))
    error(errormsg);
  end;
end;

define method leveldb-get (db :: <leveldb-t*>, options :: <leveldb-readoptions-t*>, key :: <string>) => (bytes :: <byte-vector>)
  let (data, length, errormsg) = %leveldb-get(db, options, key, key.size);
  unless (null-pointer?(errormsg))
    error(errormsg);
  end;
  let bytes = make(<byte-vector>, size: length);
  copy-bytes(bytes, 0, data, 0, length);
  bytes
end;

define function leveldb-compact-range (db :: <leveldb-t*>, start-key :: <string>, limit-key :: <string>) => ()
  %leveldb-compact-range(db, start-key, start-key.size, limit-key, limit-key.size)
end;

define function leveldb-destroy-db (options :: <leveldb-options-t*>, name :: <byte-string>) => ()
  let errormsg = %leveldb-destroy-db(options, name);
  unless (null-pointer?(errormsg))
    error(errormsg);
  end;
end;

define function leveldb-repair-db (options :: <leveldb-options-t*>, name :: <byte-string>) => ()
  let errormsg = %leveldb-repair-db(options, name);
  unless (null-pointer?(errormsg))
    error(errormsg);
  end;
end;

define method leveldb-iter-key (iter :: <leveldb-iterator-t*>) => (key :: <string>)
  let (key-data, length) = %leveldb-iter-key(iter);
  let key = make(<string>, size: length);
  copy-bytes(key, 0, key-data, 0, length);
  key
end;

define method leveldb-iter-seek (iter :: <leveldb-iterator-t*>, key :: <string>) => ()
  %leveldb-iter-seek(iter, key, key.size)
end;

define method leveldb-iter-value (iter :: <leveldb-iterator-t*>) => (value :: <byte-vector>)
  let (value-data, length) = %leveldb-iter-value(iter);
  let value = make(<byte-vector>, size: length);
  copy-bytes(value, 0, value-data, 0, length);
  value
end;

define method leveldb-writebatch-put (batch :: <leveldb-writebatch-t*>, key :: <string>, data) => ()
  %leveldb-writebatch-put(batch, key, key.size, buffer-offset(data, 0), data.size);
end;

define method leveldb-writebatch-delete (batch :: <leveldb-writebatch-t*>, key :: <string>) => ()
  %leveldb-writebatch-delete(batch, key, key.size);
end;
