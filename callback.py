# GPLv2 license - V. Reverdy - November 2015 
# Executes n times a loop calling a callback on each element of an array
# 
# python3 callback.py 8192 1048576

# Import
import sys
import os
import numpy

# Benchmark function
def benchmark(count, size, callback):
  array = numpy.arange(0, size, dtype = numpy.int32)
  function = numpy.frompyfunc(callback , 2 , 1)
  for counter in range(0, count):
    array = function.accumulate(array, dtype=numpy.object).astype(numpy.int32)
  return numpy.int32(numpy.sum(array))

# Program
numpy.seterr(all = "ignore")
argc = numpy.int32(len(sys.argv))
function = lambda n, m: n + m
os._exit(argc * benchmark(int(sys.argv[1]), int(sys.argv[2]), function))
