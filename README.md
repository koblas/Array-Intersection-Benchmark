Array Intersection Bake-off
===========================

One of those moments where an interview question turns into a research
project, or is it really a bake off?  The simple problem is demonstrate
an algorithm to intersect two lists of numbers, fundamentally it's
question about using modern interpreted languages and their associative
array bits to make a simple intersection routine.  However many languages
support many different ways to do things.  I've put together a test
of Python vs. Java vs. Ruby vs. Perl vs. PHP and got a few interesting
benchmarks.

The original blog post:
   (http://www.skitoy.com/p/array-intersection-bake-off/236)

I don't really want to time the file reading and inital array builds, just the
results.  Timing is left to the language itself, rather than an external "time" wrapper 
to eliminate startup overhead of the language.

Hopefully I've not encapuslated all of the code -  here's the current standings:

c++
    isect_1_cxx | Set   | n = 1000000 : 181272 intersects found in 0.910000 seconds

ruby
    isect_1_ruby.rb  | Set   | n = 1000000 : 164362 intersects found in 2.347703 seconds
    isect_2_ruby.rb  | Set   | n = 1000000 : 164362 intersects found in 4.859577 seconds
    isect_3_ruby.rb  | Set   | n = 1000000 : 181272 intersects found in 2.347003 seconds
    isect_4_ruby.rb  | Set   | n = 1000000 : 181272 intersects found in 3.081411 seconds

python
    isect_1_python.py  | Set   | n = 1000000 : 181272 intersects found in 0.850000 seconds
    isect_2_python.py  | Set   | n = 1000000 : 181272 intersects found in 1.870000 seconds
    isect_3_python.py  | Set   | n = 1000000 : 164362 intersects found in 0.700000 seconds
    isect_4_python.py  | Set   | n = 1000000 : 181272 intersects found in 0.540000 seconds

perl
    isect_1_perl.pl  | Set   | n = 1000000 : 181272 intersects found in 1.759258 seconds
    isect_2_perl.pl  | Set   | n = 1000000 : 181272 intersects found in 2.326255 seconds
    isect_3_perl.pl  | Set   | n = 1000000 : 181272 intersects found in 1.65167 seconds
    isect_4_perl.pl  | Set   | n = 1000000 : 181272 intersects found in 1.054326 seconds

php
    isect_1_php.php  | Set   | n = 1000001 : 181272 intersects found in 1.602538 seconds
    isect_2_php.php  | Set   | n = 1000001 : 181430 intersects found in 0.900353 seconds
    isect_3_php.php  | Set   | n = 1000001 : 181430 intersects found in 6.311304 seconds
