This library wraps `leveldb`_.

Be sure to clone this recursively::

    git clone --recursive <url for repo>

To do a build, use ``make`` so that the appropriate steps
are executed.

Please note:

* You must be using Open Dylan 2012.1 or later.
* You will also need a build of ``melange`` from the
  `melange`_ repo in your ``$PATH``.
* You must have Google's Snappy library installed.

See the TODO.rst for a more complete list of issues to be
addressed.

.. _leveldb: https://code.google.com/p/leveldb/
.. _melange: https://github.com/dylan-lang/melange
