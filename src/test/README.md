### Compiling/running unit tests

Unit tests will be automatically compiled if dependencies were met in `./configure`
and tests weren't explicitly disabled.

After configuring, they can be run with `make check`.

To run the parkingd tests manually, launch `src/test/test_parking`.

To add more parkingd tests, add `BOOST_AUTO_TEST_CASE` functions to the existing
.cpp files in the `test/` directory or add new .cpp files that
implement new BOOST_AUTO_TEST_SUITE sections.

To run the parking-qt tests manually, launch `src/qt/test/test_parking-qt`

To add more parking-qt tests, add them to the `src/qt/test/` directory and
the `src/qt/test/test_main.cpp` file.

### Running individual tests

test_parking has some built-in command-line arguments; for
example, to run just the getarg_tests verbosely:

    test_parking --log_level=all --run_test=getarg_tests

... or to run just the doubleparking test:

    test_parking --run_test=getarg_tests/doubleparking

Run `test_parking --help` for the full list.

### Note on adding test cases

The sources in this directory are unit test cases.  Boost includes a
unit testing framework, and since Parking Core already uses boost, it makes
sense to simply use this framework rather than require developers to
configure some other framework (we want as few impediments to creating
unit tests as possible).

The build system is setup to compile an executable called `test_parking`
that runs all of the unit tests.  The main source file is called
test_parking.cpp. To add a new unit test file to our test suite you need 
to add the file to `src/Makefile.test.include`. The pattern is to create 
one test file for each class or source file for which you want to create 
unit tests.  The file naming convention is `<source_filename>_tests.cpp` 
and such files should wrap their tests in a test suite 
called `<source_filename>_tests`. For an example of this pattern, 
examine `uint256_tests.cpp`.

For further reading, I found the following website to be helpful in
explaining how the boost unit test framework works:
[http://www.alittlemadness.com/2009/03/31/c-unit-testing-with-boosttest/](http://www.alittlemadness.com/2009/03/31/c-unit-testing-with-boosttest/).

### bitcoin-util-test.py

The test directory also contains the bitcoin-util-test.py tool, which tests bitcoin utils (currently just parking-tx). This test gets run automatically during the `make check` build process. It is also possible to run the test manually from the src directory:

```
test/bitcoin-util-test.py --srcdir=[current directory]

```