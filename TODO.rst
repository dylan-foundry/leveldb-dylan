* leveldb-approximate-sizes needs to be wrapped correctly.
* I currently ignore lengths returned with keys and values.
* Write tests to see that everything actually works.
* Hook up finalization so that things don't have to be
  manually destroyed.
* Write documentation descriptions + samples.
* Fix bindings for ``leveldb-iter-get-error``.
