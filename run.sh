#!/bin/sh
# GPLv2 license - V. Reverdy - November 2015 
count=65536
size=65536
./make.sh
time_f90=$(time -p ./callback_f90 $count $size 2>&1)
time_f90=$(echo $time_f90 | cut -d' ' -f4)
echo $time_f90
time_c=$(time -p ./callback_cc $count $size 2>&1)
time_c=$(echo $time_c | cut -d' ' -f4)
echo $time_c
time_cc=$(time -p ./callback_cc $count $size 2>&1)
time_cc=$(echo $time_cc | cut -d' ' -f4)
echo $time_cc
time_cpp=$(time -p ./callback_cpp $count $size 2>&1)
time_cpp=$(echo $time_cpp | cut -d' ' -f4)
echo $time_cpp
#time_py=$(time -p python3 callback.py $count $size 2>&1)
#time_py=$(echo $time_py | cut -d' ' -f4)
#echo $time_py
