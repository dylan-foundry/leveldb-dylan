*******************
The LEVELDB library
*******************

The LEVELDB module
==================

.. current-library:: leveldb
.. current-module:: leveldb

Database Management
-------------------

.. function:: leveldb-close

   :signature: leveldb-close (db) => ()

   :parameter db: An instance of ``<leveldb-t*>``.

.. function:: leveldb-destroy-db

   :signature: leveldb-destroy-db (options name) => ()

   :parameter options: An instance of ``<leveldb-options-t*>``.
   :parameter name: An instance of ``<byte-string>``.

.. function:: leveldb-major-version

   :signature: leveldb-major-version () => (res)

   :value res: An instance of ``<c-signed-int>``.

.. function:: leveldb-minor-version

   :signature: leveldb-minor-version () => (res)

   :value res: An instance of ``<c-signed-int>``.

.. function:: leveldb-open

   :signature: leveldb-open (options name) => (db)

   :parameter options: An instance of ``<leveldb-options-t*>``.
   :parameter name: An instance of ``<byte-string>``.
   :value db: An instance of ``<leveldb-t*>``.

.. function:: leveldb-repair-db

   :signature: leveldb-repair-db (options name) => ()

   :parameter options: An instance of ``<leveldb-options-t*>``.
   :parameter name: An instance of ``<byte-string>``.

Data Management
---------------

.. generic-function:: leveldb-delete

   :signature: leveldb-delete (db options key) => ()

   :parameter db: An instance of ``<leveldb-t*>``.
   :parameter options: An instance of ``<leveldb-options-t*>``.
   :parameter key: An instance of ``<string>``.

.. generic-function:: leveldb-get

   :signature: leveldb-get (db options key) => (bytes)

   :parameter db: An instance of ``<leveldb-t*>``.
   :parameter options: An instance of ``<leveldb-readoptions-t*>``.
   :parameter key: An instance of ``<string>``.
   :value bytes: An instance of ``<byte-vector>``.

.. generic-function:: leveldb-put

   :signature: leveldb-put (db options key data) => ()

   :parameter db: An instance of ``<leveldb-t*>``.
   :parameter options: An instance of ``<leveldb-writeoptions-t*>``.
   :parameter key: An instance of ``<string>``.
   :parameter data: An instance of ``<buffer>``, ``<byte-vector>`` or
     ``<string>``.

Iterators
---------

.. function:: leveldb-create-iterator

   :signature: leveldb-create-iterator (db options) => (res)

   :parameter db: An instance of ``<leveldb-t*>``.
   :parameter options: An instance of ``<leveldb-readoptions-t*>``.
   :value res: An instance of ``<leveldb-iterator-t*>``.

.. function:: leveldb-iter-destroy

   :signature: leveldb-iter-destroy (arg1) => ()

   :parameter arg1: An instance of ``<leveldb-iterator-t*>``.

.. function:: leveldb-iter-get-error

   :signature: leveldb-iter-get-error (arg1) => (errptr)

   :parameter arg1: An instance of ``<leveldb-iterator-t*>``.
   :value errptr: An instance of ``<char**>``.

.. function:: leveldb-iter-key

   :signature: leveldb-iter-key (arg1) => (res klen)

   :parameter arg1: An instance of ``<leveldb-iterator-t*>``.
   :value res: An instance of ``<c-string>``.
   :value klen: An instance of ``<size-t*>``.

.. function:: leveldb-iter-next

   :signature: leveldb-iter-next (arg1) => ()

   :parameter arg1: An instance of ``<leveldb-iterator-t*>``.

.. function:: leveldb-iter-prev

   :signature: leveldb-iter-prev (arg1) => ()

   :parameter arg1: An instance of ``<leveldb-iterator-t*>``.

.. generic-function:: leveldb-iter-seek

   :signature: leveldb-iter-seek (iter key) => ()

   :parameter iter: An instance of ``<leveldb-iterator-t*>``.
   :parameter key: An instance of ``<string>``.

.. function:: leveldb-iter-seek-to-first

   :signature: leveldb-iter-seek-to-first (arg1) => ()

   :parameter arg1: An instance of ``<leveldb-iterator-t*>``.

.. function:: leveldb-iter-seek-to-last

   :signature: leveldb-iter-seek-to-last (arg1) => ()

   :parameter arg1: An instance of ``<leveldb-iterator-t*>``.

.. function:: leveldb-iter-valid

   :signature: leveldb-iter-valid (arg1) => (res)

   :parameter arg1: An instance of ``<leveldb-iterator-t*>``.
   :value res: An instance of ``<boolean>``.

.. function:: leveldb-iter-value

   :signature: leveldb-iter-value (arg1) => (res vlen)

   :parameter arg1: An instance of ``<leveldb-iterator-t*>``.
   :value res: An instance of ``<c-string>``.
   :value vlen: An instance of ``<size-t*>``.

Options
-------

.. function:: leveldb-options-create

   :signature: leveldb-options-create () => (res)

   :value res: An instance of ``<leveldb-options-t*>``.

.. function:: leveldb-options-destroy

   :signature: leveldb-options-destroy (arg1) => ()

   :parameter arg1: An instance of ``<leveldb-options-t*>``.

.. function:: leveldb-options-set-block-restart-interval

   :signature: leveldb-options-set-block-restart-interval (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-options-t*>``.
   :parameter arg2: An instance of ``<c-signed-int>``.

.. function:: leveldb-options-set-block-size

   :signature: leveldb-options-set-block-size (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-options-t*>``.
   :parameter arg2: An instance of ``<size-t>``.

.. function:: leveldb-options-set-cache

   :signature: leveldb-options-set-cache (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-options-t*>``.
   :parameter arg2: An instance of ``<leveldb-cache-t*>``.

.. function:: leveldb-options-set-comparator

   :signature: leveldb-options-set-comparator (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-options-t*>``.
   :parameter arg2: An instance of ``<leveldb-comparator-t*>``.

.. constant:: $leveldb-no-compression

.. constant:: $leveldb-snappy-compression

.. function:: leveldb-options-set-compression

   :signature: leveldb-options-set-compression (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-options-t*>``.
   :parameter arg2: An instance of ``<c-signed-int>``.

.. function:: leveldb-options-set-create-if-missing

   :signature: leveldb-options-set-create-if-missing (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-options-t*>``.
   :parameter arg2: An instance of ``<boolean>``.

.. function:: leveldb-options-set-env

   :signature: leveldb-options-set-env (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-options-t*>``.
   :parameter arg2: An instance of ``<leveldb-env-t*>``.

.. function:: leveldb-options-set-error-if-exists

   :signature: leveldb-options-set-error-if-exists (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-options-t*>``.
   :parameter arg2: An instance of ``<boolean>``.

.. function:: leveldb-options-set-filter-policy

   :signature: leveldb-options-set-filter-policy (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-options-t*>``.
   :parameter arg2: An instance of ``<leveldb-filterpolicy-t*>``.

.. function:: leveldb-options-set-info-log

   :signature: leveldb-options-set-info-log (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-options-t*>``.
   :parameter arg2: An instance of ``<leveldb-logger-t*>``.

.. function:: leveldb-options-set-max-open-files

   :signature: leveldb-options-set-max-open-files (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-options-t*>``.
   :parameter arg2: An instance of ``<c-signed-int>``.

.. function:: leveldb-options-set-paranoid-checks

   :signature: leveldb-options-set-paranoid-checks (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-options-t*>``.
   :parameter arg2: An instance of ``<boolean>``.

.. function:: leveldb-options-set-write-buffer-size

   :signature: leveldb-options-set-write-buffer-size (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-options-t*>``.
   :parameter arg2: An instance of ``<size-t>``.

.. function:: leveldb-readoptions-create

   :signature: leveldb-readoptions-create () => (res)

   :value res: An instance of ``<leveldb-readoptions-t*>``.

.. function:: leveldb-readoptions-destroy

   :signature: leveldb-readoptions-destroy (arg1) => ()

   :parameter arg1: An instance of ``<leveldb-readoptions-t*>``.

.. function:: leveldb-readoptions-set-fill-cache

   :signature: leveldb-readoptions-set-fill-cache (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-readoptions-t*>``.
   :parameter arg2: An instance of ``<boolean>``.

.. function:: leveldb-readoptions-set-snapshot

   :signature: leveldb-readoptions-set-snapshot (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-readoptions-t*>``.
   :parameter arg2: An instance of ``<leveldb-snapshot-t*>``.

.. function:: leveldb-readoptions-set-verify-checksums

   :signature: leveldb-readoptions-set-verify-checksums (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-readoptions-t*>``.
   :parameter arg2: An instance of ``<boolean>``.

.. function:: leveldb-writeoptions-create

   :signature: leveldb-writeoptions-create () => (res)

   :value res: An instance of ``<leveldb-writeoptions-t*>``.

.. function:: leveldb-writeoptions-destroy

   :signature: leveldb-writeoptions-destroy (arg1) => ()

   :parameter arg1: An instance of ``<leveldb-writeoptions-t*>``.

.. function:: leveldb-writeoptions-set-sync

   :signature: leveldb-writeoptions-set-sync (arg1 arg2) => ()

   :parameter arg1: An instance of ``<leveldb-writeoptions-t*>``.
   :parameter arg2: An instance of ``<boolean>``.

Write Batching
--------------

.. generic-function:: leveldb-write

   :signature: leveldb-write (db options batch) => ()

   :parameter db: An instance of ``<leveldb-t*>``.
   :parameter options: An instance of ``<leveldb-writeoptions-t*>``.
   :parameter batch: An instance of ``<leveldb-writebatch-t*>``.

.. function:: leveldb-writebatch-clear

   :signature: leveldb-writebatch-clear (arg1) => ()

   :parameter arg1: An instance of ``<leveldb-writebatch-t*>``.

.. function:: leveldb-writebatch-create

   :signature: leveldb-writebatch-create () => (res)

   :value res: An instance of ``<leveldb-writebatch-t*>``.

.. generic-function:: leveldb-writebatch-delete

   :signature: leveldb-writebatch-delete (batch key) => ()

   :parameter batch: An instance of ``<leveldb-writebatch-t*>``.
   :parameter key: An instance of ``<string>``.

.. function:: leveldb-writebatch-destroy

   :signature: leveldb-writebatch-destroy (arg1) => ()

   :parameter arg1: An instance of ``<leveldb-writebatch-t*>``.

.. function:: leveldb-writebatch-iterate

   :signature: leveldb-writebatch-iterate (arg1 state put deleted) => ()

   :parameter arg1: An instance of ``<leveldb-writebatch-t*>``.
   :parameter state: An instance of ``<c-void*>``.
   :parameter put: An instance of ``<anonymous-31*>``.
   :parameter deleted: An instance of ``<anonymous-32*>``.

.. generic-function:: leveldb-writebatch-put

   :signature: leveldb-writebatch-put (batch key data) => ()

   :parameter batch: An instance of ``<leveldb-writebatch-t*>``.
   :parameter key: An instance of ``<string>``.
   :parameter data: An instance of ``<buffer>``, ``<byte-vector>`` or
      ``<string>``.

Other Stuff
-----------

.. function:: leveldb-approximate-sizes

   :signature: leveldb-approximate-sizes (db num-ranges range-start-key range-start-key-len range-limit-key range-limit-key-len sizes) => ()

   :parameter db: An instance of ``<leveldb-t*>``.
   :parameter num-ranges: An instance of ``<c-signed-int>``.
   :parameter range-start-key: An instance of ``<char**>``.
   :parameter range-start-key-len: An instance of ``<size-t*>``.
   :parameter range-limit-key: An instance of ``<char**>``.
   :parameter range-limit-key-len: An instance of ``<size-t*>``.
   :parameter sizes: An instance of ``<uint64-t*>``.

.. function:: leveldb-cache-create-lru

   :signature: leveldb-cache-create-lru (capacity) => (res)

   :parameter capacity: An instance of ``<size-t>``.
   :value res: An instance of ``<leveldb-cache-t*>``.

.. function:: leveldb-cache-destroy

   :signature: leveldb-cache-destroy (cache) => ()

   :parameter cache: An instance of ``<leveldb-cache-t*>``.

.. function:: leveldb-compact-range

   :signature: leveldb-compact-range (db start-key limit-key) => ()

   :parameter db: An instance of ``<leveldb-t*>``.
   :parameter start-key: An instance of ``<string>``.
   :parameter limit-key: An instance of ``<string>``.

.. function:: leveldb-comparator-create

   :signature: leveldb-comparator-create (state destructor compare name) => (res)

   :parameter state: An instance of ``<c-void*>``.
   :parameter destructor: An instance of ``<anonymous-50*>``.
   :parameter compare: An instance of ``<anonymous-51*>``.
   :parameter name: An instance of ``<anonymous-52*>``.
   :value res: An instance of ``<leveldb-comparator-t*>``.

.. function:: leveldb-comparator-destroy

   :signature: leveldb-comparator-destroy (arg1) => ()

   :parameter arg1: An instance of ``<leveldb-comparator-t*>``.

.. function:: leveldb-create-default-env

   :signature: leveldb-create-default-env () => (res)

   :value res: An instance of ``<leveldb-env-t*>``.

.. function:: leveldb-create-snapshot

   :signature: leveldb-create-snapshot (db) => (res)

   :parameter db: An instance of ``<leveldb-t*>``.
   :value res: An instance of ``<leveldb-snapshot-t*>``.

.. function:: leveldb-env-destroy

   :signature: leveldb-env-destroy (arg1) => ()

   :parameter arg1: An instance of ``<leveldb-env-t*>``.

.. function:: leveldb-filterpolicy-create

   :signature: leveldb-filterpolicy-create (state destructor create-filter key-may-match name) => (res)

   :parameter state: An instance of ``<c-void*>``.
   :parameter destructor: An instance of ``<anonymous-55*>``.
   :parameter create-filter: An instance of ``<anonymous-56*>``.
   :parameter key-may-match: An instance of ``<anonymous-57*>``.
   :parameter name: An instance of ``<anonymous-58*>``.
   :value res: An instance of ``<leveldb-filterpolicy-t*>``.

.. function:: leveldb-filterpolicy-create-bloom

   :signature: leveldb-filterpolicy-create-bloom (bits-per-key) => (res)

   :parameter bits-per-key: An instance of ``<c-signed-int>``.
   :value res: An instance of ``<leveldb-filterpolicy-t*>``.

.. function:: leveldb-filterpolicy-destroy

   :signature: leveldb-filterpolicy-destroy (arg1) => ()

   :parameter arg1: An instance of ``<leveldb-filterpolicy-t*>``.

.. function:: leveldb-free

   :signature: leveldb-free (ptr) => ()

   :parameter ptr: An instance of ``<c-void*>``.

.. function:: leveldb-property-value

   :signature: leveldb-property-value (db propname) => (res)

   :parameter db: An instance of ``<leveldb-t*>``.
   :parameter propname: An instance of ``<c-string>``.
   :value res: An instance of ``<c-string>``.

.. function:: leveldb-release-snapshot

   :signature: leveldb-release-snapshot (db snapshot) => ()

   :parameter db: An instance of ``<leveldb-t*>``.
   :parameter snapshot: An instance of ``<leveldb-snapshot-t*>``.

