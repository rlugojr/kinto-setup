===========
Kinto Setup
===========

.. image:: https://img.shields.io/travis/Kinto/kinto-setup.svg
        :target: https://travis-ci.org/Kinto/kinto-setup

.. image:: https://img.shields.io/pypi/v/kinto-setup.svg
        :target: https://pypi.python.org/pypi/kinto-setup

.. image:: https://coveralls.io/repos/Kinto/kinto-setup/badge.svg?branch=master
        :target: https://coveralls.io/r/Kinto/kinto-setup

Export data from a server into a file to import it in another server
or backup its information.


Install
-------

::

    pip install kinto-setup


Usage
-----

::

    $ kinto-setup export --auth user:pass --output export.json \
          https://kinto.dev.mozaws.net/v1/buckets/onecrl/*

    $ kinto-setup import --auth user:pass  --input export.json  \
          https://kinto.dev.mozaws.net/v1/

    # OR with httpie

    $ cat export.json | http POST https://kinto.dev.mozaws.net/v1/batch \
          --auth user:pass

    # OR with curl

    $ curl -u user:pass -H "Content-Type: application/json" --data @export.json \
          https://kinto.dev.mozaws.net/v1/batch
