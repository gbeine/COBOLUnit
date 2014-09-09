COBOLUnit
=========

COBOLUnit is a unit testing framework for OpenCOBOL (fork)

It is a fork from https://code.google.com/p/cobolunit/

COBOLUnit Features
------------------

* Two assertions types could be used:
 * Equals for string
 * Equals for numeric format
* Declaration of a test which include assertions.
* Declaration a tests suite including declared tests
* Declaration of a suites tests case including declared suites
* Add an assertion to a test
* Add a test to a specific suite
* Add a suite to the tests suites case
* Run the global suites tests case
* Run a specific test suites
* Display log results

Upcoming Features
-----------------

* Create a log file with the log result
* Adding a user suite context for each suite to enable its use during tests
* Add 'SetUp' and 'Teardown' routines for suites to setup and teardown suite context
* Code generation for the tests suites Case from a flat file
* Adding new assert types (notEquals, greaterThan, LesserThan,...)
