module: dylan-user

define library leveldb
  use common-dylan;
  use c-ffi;

  export leveldb;
end library;

define module leveldb
  use common-dylan;
  use c-ffi;

  export $leveldb-no-compression, $leveldb-snappy-compression;

  export leveldb-open, leveldb-close, leveldb-put, leveldb-delete,
    leveldb-write, leveldb-get;

  export leveldb-create-iterator, leveldb-create-snapshot,
    leveldb-release-snapshot;

  export leveldb-property-value, leveldb-approximate-sizes,
    leveldb-compact-range, leveldb-destroy-db, leveldb-repair-db,
    leveldb-iter-destroy, leveldb-iter-valid, leveldb-iter-seek-to-first,
    leveldb-iter-seek-to-last, leveldb-iter-seek, leveldb-iter-next,
    leveldb-iter-prev, leveldb-iter-key, leveldb-iter-value,
    leveldb-iter-get-error;

  export leveldb-writebatch-create, leveldb-writebatch-destroy,
    leveldb-writebatch-clear, leveldb-writebatch-put,
    leveldb-writebatch-delete, leveldb-writebatch-iterate;

  export leveldb-options-create, leveldb-options-destroy,
    leveldb-options-set-comparator, leveldb-options-set-filter-policy,
    leveldb-options-set-create-if-missing, leveldb-options-set-error-if-exists,
    leveldb-options-set-paranoid-checks, leveldb-options-set-env,
    leveldb-options-set-info-log, leveldb-options-set-write-buffer-size,
    leveldb-options-set-max-open-files, leveldb-options-set-cache,
    leveldb-options-set-block-size, leveldb-options-set-block-restart-interval,
    leveldb-options-set-compression;

  export leveldb-comparator-create, leveldb-comparator-destroy;

  export leveldb-filterpolicy-create, leveldb-filterpolicy-destroy,
    leveldb-filterpolicy-create-bloom;

  export leveldb-readoptions-create, leveldb-readoptions-destroy,
    leveldb-readoptions-set-verify-checksums,
    leveldb-readoptions-set-fill-cache,
    leveldb-readoptions-set-snapshot;

  export leveldb-writeoptions-create, leveldb-writeoptions-destroy,
    leveldb-writeoptions-set-sync;

  export leveldb-cache-create-lru, leveldb-cache-destroy;

  export leveldb-create-default-env, leveldb-env-destroy;

  export leveldb-free;

  export leveldb-major-version, leveldb-minor-version;
end module;
