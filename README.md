Test mixing Google Test https://code.google.com/p/googletest/ 
and Perl. Workflow: 
* Create (static) perl binding of the code to test
* Create (static) perl interpreter and static base extensions
* Use GTest unittest to start perl snippets
* Use Eclipse GTest unittest framework

Create (static) perl interpreter and static base extensions:
* Linux:  "make static" using App-Staticperl-1.43 
* MacOSX: "make static" using App-Staticperl-1.43 
* Cygwin: "make static" using App-Staticperl-1.43 with patches
* Win native: "make OS=MINGW static" using App-Staticperl-1.43 for perl download with patches and strawberry-perl-5.18.2.2-64bit-portable with dmake to build
