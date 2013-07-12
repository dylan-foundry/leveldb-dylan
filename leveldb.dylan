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

define C-struct <leveldb-t>
end;

define C-struct <leveldb-cache-t>
end;

define C-struct <leveldb-comparator-t>
end;

define C-struct <leveldb-env-t>
end;

define C-struct <leveldb-filelock-t>
end;

define C-struct <leveldb-filterpolicy-t>
end;

define C-struct <leveldb-iterator-t>
end;

define C-struct <leveldb-logger-t>
end;

define C-struct <leveldb-options-t>
end;

define C-struct <leveldb-randomfile-t>
end;

define C-struct <leveldb-readoptions-t>
end;

define C-struct <leveldb-seqfile-t>
end;

define C-struct <leveldb-snapshot-t>
end;

define C-struct <leveldb-writablefile-t>
end;

define C-struct <leveldb-writebatch-t>
end;

define C-struct <leveldb-writeoptions-t>
end;

define C-pointer-type <leveldb-t*> => <leveldb-t>;
define C-pointer-type <leveldb-options-t*> => <leveldb-options-t>;
define C-pointer-type <c-string> => <C-signed-char>;
define C-pointer-type <char**> => <c-string>;
define C-function %leveldb-open
  input parameter options_ :: <leveldb-options-t*>;
  input parameter name_ :: <c-string>;
  output parameter errptr_ :: <char**>;
  result res :: <leveldb-t*>;
  c-name: "leveldb_open";
end;

define C-function leveldb-close
  input parameter db_ :: <leveldb-t*>;
  c-name: "leveldb_close";
end;

define C-pointer-type <leveldb-writeoptions-t*> => <leveldb-writeoptions-t>;
define constant <__darwin-size-t> = <C-unsigned-long>;

define constant <size-t> = <__darwin-size-t>;

define C-function %leveldb-put
  input parameter db_ :: <leveldb-t*>;
  input parameter options_ :: <leveldb-writeoptions-t*>;
  input parameter key_ :: <c-string>;
  input parameter keylen_ :: <size-t>;
  input parameter val_ :: <C-buffer-offset>;
  input parameter vallen_ :: <size-t>;
  output parameter errptr_ :: <char**>;
  c-name: "leveldb_put";
end;

define C-function %leveldb-delete
  input parameter db_ :: <leveldb-t*>;
  input parameter options_ :: <leveldb-writeoptions-t*>;
  input parameter key_ :: <c-string>;
  input parameter keylen_ :: <size-t>;
  output parameter errptr_ :: <char**>;
  c-name: "leveldb_delete";
end;

define C-pointer-type <leveldb-writebatch-t*> => <leveldb-writebatch-t>;
define C-function %leveldb-write
  input parameter db_ :: <leveldb-t*>;
  input parameter options_ :: <leveldb-writeoptions-t*>;
  input parameter batch_ :: <leveldb-writebatch-t*>;
  output parameter errptr_ :: <char**>;
  c-name: "leveldb_write";
end;

define C-pointer-type <leveldb-readoptions-t*> => <leveldb-readoptions-t>;
define C-pointer-type <size-t*> => <size-t>;
define C-function %leveldb-get
  input parameter db_ :: <leveldb-t*>;
  input parameter options_ :: <leveldb-readoptions-t*>;
  input parameter key_ :: <c-string>;
  input parameter keylen_ :: <size-t>;
  output parameter vallen_ :: <size-t*>;
  output parameter errptr_ :: <char**>;
  result res :: <c-string>;
  c-name: "leveldb_get";
end;

define C-pointer-type <leveldb-iterator-t*> => <leveldb-iterator-t>;
define C-function leveldb-create-iterator
  input parameter db_ :: <leveldb-t*>;
  input parameter options_ :: <leveldb-readoptions-t*>;
  result res :: <leveldb-iterator-t*>;
  c-name: "leveldb_create_iterator";
end;

define C-pointer-type <leveldb-snapshot-t*> => <leveldb-snapshot-t>;
define C-function leveldb-create-snapshot
  input parameter db_ :: <leveldb-t*>;
  result res :: <leveldb-snapshot-t*>;
  c-name: "leveldb_create_snapshot";
end;

define C-function leveldb-release-snapshot
  input parameter db_ :: <leveldb-t*>;
  input parameter snapshot_ :: <leveldb-snapshot-t*>;
  c-name: "leveldb_release_snapshot";
end;

define C-function leveldb-property-value
  input parameter db_ :: <leveldb-t*>;
  input parameter propname_ :: <c-string>;
  result res :: <c-string>;
  c-name: "leveldb_property_value";
end;

define constant <uint64-t> = <C-unsigned-long>;

define C-pointer-type <uint64-t*> => <uint64-t>;
define C-function leveldb-approximate-sizes
  input parameter db_ :: <leveldb-t*>;
  input parameter num-ranges_ :: <C-signed-int>;
  input parameter range-start-key_ :: <char**>;
  input parameter range-start-key-len_ :: <size-t*>;
  input parameter range-limit-key_ :: <char**>;
  input parameter range-limit-key-len_ :: <size-t*>;
  input parameter sizes_ :: <uint64-t*>;
  c-name: "leveldb_approximate_sizes";
end;

define C-function %leveldb-compact-range
  input parameter db_ :: <leveldb-t*>;
  input parameter start-key_ :: <c-string>;
  input parameter start-key-len_ :: <size-t>;
  input parameter limit-key_ :: <c-string>;
  input parameter limit-key-len_ :: <size-t>;
  c-name: "leveldb_compact_range";
end;

define C-function %leveldb-destroy-db
  input parameter options_ :: <leveldb-options-t*>;
  input parameter name_ :: <c-string>;
  output parameter errptr_ :: <char**>;
  c-name: "leveldb_destroy_db";
end;

define C-function %leveldb-repair-db
  input parameter options_ :: <leveldb-options-t*>;
  input parameter name_ :: <c-string>;
  output parameter errptr_ :: <char**>;
  c-name: "leveldb_repair_db";
end;

define C-function leveldb-iter-destroy
  input parameter arg1_ :: <leveldb-iterator-t*>;
  c-name: "leveldb_iter_destroy";
end;

define C-function leveldb-iter-valid
  input parameter arg1_ :: <leveldb-iterator-t*>;
  result res :: <C-boolean>;
  c-name: "leveldb_iter_valid";
end;

define C-function leveldb-iter-seek-to-first
  input parameter arg1_ :: <leveldb-iterator-t*>;
  c-name: "leveldb_iter_seek_to_first";
end;

define C-function leveldb-iter-seek-to-last
  input parameter arg1_ :: <leveldb-iterator-t*>;
  c-name: "leveldb_iter_seek_to_last";
end;

define C-function %leveldb-iter-seek
  input parameter arg1_ :: <leveldb-iterator-t*>;
  input parameter k_ :: <c-string>;
  input parameter klen_ :: <size-t>;
  c-name: "leveldb_iter_seek";
end;

define C-function leveldb-iter-next
  input parameter arg1_ :: <leveldb-iterator-t*>;
  c-name: "leveldb_iter_next";
end;

define C-function leveldb-iter-prev
  input parameter arg1_ :: <leveldb-iterator-t*>;
  c-name: "leveldb_iter_prev";
end;

define C-function %leveldb-iter-key
  input parameter arg1_ :: <leveldb-iterator-t*>;
  output parameter klen_ :: <size-t*>;
  result res :: <c-string>;
  c-name: "leveldb_iter_key";
end;

define C-function %leveldb-iter-value
  input parameter arg1_ :: <leveldb-iterator-t*>;
  output parameter vlen_ :: <size-t*>;
  result res :: <c-string>;
  c-name: "leveldb_iter_value";
end;

define C-function leveldb-iter-get-error
  input parameter arg1_ :: <leveldb-iterator-t*>;
  output parameter errptr_ :: <char**>;
  c-name: "leveldb_iter_get_error";
end;

define C-function leveldb-writebatch-create
  result res :: <leveldb-writebatch-t*>;
  c-name: "leveldb_writebatch_create";
end;

define C-function leveldb-writebatch-destroy
  input parameter arg1_ :: <leveldb-writebatch-t*>;
  c-name: "leveldb_writebatch_destroy";
end;

define C-function leveldb-writebatch-clear
  input parameter arg1_ :: <leveldb-writebatch-t*>;
  c-name: "leveldb_writebatch_clear";
end;

define C-function %leveldb-writebatch-put
  input parameter arg1_ :: <leveldb-writebatch-t*>;
  input parameter key_ :: <c-string>;
  input parameter klen_ :: <size-t>;
  input parameter val_ :: <C-buffer-offset>;
  input parameter vlen_ :: <size-t>;
  c-name: "leveldb_writebatch_put";
end;

define C-function %leveldb-writebatch-delete
  input parameter arg1_ :: <leveldb-writebatch-t*>;
  input parameter key_ :: <c-string>;
  input parameter klen_ :: <size-t>;
  c-name: "leveldb_writebatch_delete";
end;

define constant <anonymous-31> = <C-function-pointer>;
define C-pointer-type <anonymous-31*> => <anonymous-31>;
define constant <anonymous-32> = <C-function-pointer>;
define C-pointer-type <anonymous-32*> => <anonymous-32>;
define C-function leveldb-writebatch-iterate
  input parameter arg1_ :: <leveldb-writebatch-t*>;
  input parameter state_ :: <C-void*>;
  input parameter put_ :: <anonymous-31*>;
  input parameter deleted_ :: <anonymous-32*>;
  c-name: "leveldb_writebatch_iterate";
end;

define C-function leveldb-options-create
  result res :: <leveldb-options-t*>;
  c-name: "leveldb_options_create";
end;

define C-function leveldb-options-destroy
  input parameter arg1_ :: <leveldb-options-t*>;
  c-name: "leveldb_options_destroy";
end;

define C-pointer-type <leveldb-comparator-t*> => <leveldb-comparator-t>;
define C-function leveldb-options-set-comparator
  input parameter arg1_ :: <leveldb-options-t*>;
  input parameter arg2_ :: <leveldb-comparator-t*>;
  c-name: "leveldb_options_set_comparator";
end;

define C-pointer-type <leveldb-filterpolicy-t*> => <leveldb-filterpolicy-t>;
define C-function leveldb-options-set-filter-policy
  input parameter arg1_ :: <leveldb-options-t*>;
  input parameter arg2_ :: <leveldb-filterpolicy-t*>;
  c-name: "leveldb_options_set_filter_policy";
end;

define C-function leveldb-options-set-create-if-missing
  input parameter arg1_ :: <leveldb-options-t*>;
  input parameter arg2_ :: <C-boolean>;
  c-name: "leveldb_options_set_create_if_missing";
end;

define C-function leveldb-options-set-error-if-exists
  input parameter arg1_ :: <leveldb-options-t*>;
  input parameter arg2_ :: <C-boolean>;
  c-name: "leveldb_options_set_error_if_exists";
end;

define C-function leveldb-options-set-paranoid-checks
  input parameter arg1_ :: <leveldb-options-t*>;
  input parameter arg2_ :: <C-boolean>;
  c-name: "leveldb_options_set_paranoid_checks";
end;

define C-pointer-type <leveldb-env-t*> => <leveldb-env-t>;
define C-function leveldb-options-set-env
  input parameter arg1_ :: <leveldb-options-t*>;
  input parameter arg2_ :: <leveldb-env-t*>;
  c-name: "leveldb_options_set_env";
end;

define C-pointer-type <leveldb-logger-t*> => <leveldb-logger-t>;
define C-function leveldb-options-set-info-log
  input parameter arg1_ :: <leveldb-options-t*>;
  input parameter arg2_ :: <leveldb-logger-t*>;
  c-name: "leveldb_options_set_info_log";
end;

define C-function leveldb-options-set-write-buffer-size
  input parameter arg1_ :: <leveldb-options-t*>;
  input parameter arg2_ :: <size-t>;
  c-name: "leveldb_options_set_write_buffer_size";
end;

define C-function leveldb-options-set-max-open-files
  input parameter arg1_ :: <leveldb-options-t*>;
  input parameter arg2_ :: <C-signed-int>;
  c-name: "leveldb_options_set_max_open_files";
end;

define C-pointer-type <leveldb-cache-t*> => <leveldb-cache-t>;
define C-function leveldb-options-set-cache
  input parameter arg1_ :: <leveldb-options-t*>;
  input parameter arg2_ :: <leveldb-cache-t*>;
  c-name: "leveldb_options_set_cache";
end;

define C-function leveldb-options-set-block-size
  input parameter arg1_ :: <leveldb-options-t*>;
  input parameter arg2_ :: <size-t>;
  c-name: "leveldb_options_set_block_size";
end;

define C-function leveldb-options-set-block-restart-interval
  input parameter arg1_ :: <leveldb-options-t*>;
  input parameter arg2_ :: <C-signed-int>;
  c-name: "leveldb_options_set_block_restart_interval";
end;

define constant $leveldb-no-compression = 0;
define constant $leveldb-snappy-compression = 1;

define C-function leveldb-options-set-compression
  input parameter arg1_ :: <leveldb-options-t*>;
  input parameter arg2_ :: <C-signed-int>;
  c-name: "leveldb_options_set_compression";
end;

define constant <anonymous-50> = <C-function-pointer>;
define C-pointer-type <anonymous-50*> => <anonymous-50>;
define constant <anonymous-51> = <C-function-pointer>;
define C-pointer-type <anonymous-51*> => <anonymous-51>;
define constant <anonymous-52> = <C-function-pointer>;
define C-pointer-type <anonymous-52*> => <anonymous-52>;
define C-function leveldb-comparator-create
  input parameter state_ :: <C-void*>;
  input parameter destructor_ :: <anonymous-50*>;
  input parameter compare_ :: <anonymous-51*>;
  input parameter name_ :: <anonymous-52*>;
  result res :: <leveldb-comparator-t*>;
  c-name: "leveldb_comparator_create";
end;

define C-function leveldb-comparator-destroy
  input parameter arg1_ :: <leveldb-comparator-t*>;
  c-name: "leveldb_comparator_destroy";
end;

define constant <anonymous-55> = <C-function-pointer>;
define C-pointer-type <anonymous-55*> => <anonymous-55>;
define constant <anonymous-56> = <C-function-pointer>;
define C-pointer-type <anonymous-56*> => <anonymous-56>;
define constant <anonymous-57> = <C-function-pointer>;
define C-pointer-type <anonymous-57*> => <anonymous-57>;
define constant <anonymous-58> = <C-function-pointer>;
define C-pointer-type <anonymous-58*> => <anonymous-58>;
define C-function leveldb-filterpolicy-create
  input parameter state_ :: <C-void*>;
  input parameter destructor_ :: <anonymous-55*>;
  input parameter create-filter_ :: <anonymous-56*>;
  input parameter key-may-match_ :: <anonymous-57*>;
  input parameter name_ :: <anonymous-58*>;
  result res :: <leveldb-filterpolicy-t*>;
  c-name: "leveldb_filterpolicy_create";
end;

define C-function leveldb-filterpolicy-destroy
  input parameter arg1_ :: <leveldb-filterpolicy-t*>;
  c-name: "leveldb_filterpolicy_destroy";
end;

define C-function leveldb-filterpolicy-create-bloom
  input parameter bits-per-key_ :: <C-signed-int>;
  result res :: <leveldb-filterpolicy-t*>;
  c-name: "leveldb_filterpolicy_create_bloom";
end;

define C-function leveldb-readoptions-create
  result res :: <leveldb-readoptions-t*>;
  c-name: "leveldb_readoptions_create";
end;

define C-function leveldb-readoptions-destroy
  input parameter arg1_ :: <leveldb-readoptions-t*>;
  c-name: "leveldb_readoptions_destroy";
end;

define C-function leveldb-readoptions-set-verify-checksums
  input parameter arg1_ :: <leveldb-readoptions-t*>;
  input parameter arg2_ :: <C-boolean>;
  c-name: "leveldb_readoptions_set_verify_checksums";
end;

define C-function leveldb-readoptions-set-fill-cache
  input parameter arg1_ :: <leveldb-readoptions-t*>;
  input parameter arg2_ :: <C-boolean>;
  c-name: "leveldb_readoptions_set_fill_cache";
end;

define C-function leveldb-readoptions-set-snapshot
  input parameter arg1_ :: <leveldb-readoptions-t*>;
  input parameter arg2_ :: <leveldb-snapshot-t*>;
  c-name: "leveldb_readoptions_set_snapshot";
end;

define C-function leveldb-writeoptions-create
  result res :: <leveldb-writeoptions-t*>;
  c-name: "leveldb_writeoptions_create";
end;

define C-function leveldb-writeoptions-destroy
  input parameter arg1_ :: <leveldb-writeoptions-t*>;
  c-name: "leveldb_writeoptions_destroy";
end;

define C-function leveldb-writeoptions-set-sync
  input parameter arg1_ :: <leveldb-writeoptions-t*>;
  input parameter arg2_ :: <C-boolean>;
  c-name: "leveldb_writeoptions_set_sync";
end;

define C-function leveldb-cache-create-lru
  input parameter capacity_ :: <size-t>;
  result res :: <leveldb-cache-t*>;
  c-name: "leveldb_cache_create_lru";
end;

define C-function leveldb-cache-destroy
  input parameter cache_ :: <leveldb-cache-t*>;
  c-name: "leveldb_cache_destroy";
end;

define C-function leveldb-create-default-env
  result res :: <leveldb-env-t*>;
  c-name: "leveldb_create_default_env";
end;

define C-function leveldb-env-destroy
  input parameter arg1_ :: <leveldb-env-t*>;
  c-name: "leveldb_env_destroy";
end;

define C-function leveldb-free
  input parameter ptr_ :: <C-void*>;
  c-name: "leveldb_free";
end;

define C-function leveldb-major-version
  result res :: <C-signed-int>;
  c-name: "leveldb_major_version";
end;

define C-function leveldb-minor-version
  result res :: <C-signed-int>;
  c-name: "leveldb_minor_version";
end;

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
