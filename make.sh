#!/bin/sh
# GPLv2 license - V. Reverdy - November 2015 
gfortran -std=f2008 -Wall -Wextra -O3 callback.f90 -o callback_f90
gcc -std=c11 -Wall -Wextra -pedantic -O3 callback.c -o callback_c
g++ -std=c++11 -Wall -Wextra -pedantic -O3 callback.cc -o callback_cc
g++ -std=c++11 -Wall -Wextra -pedantic -O3 callback.cpp -o callback_cpp
