// GPLv2 license - V. Reverdy - November 2015 
// Executes n times a loop calling a callback on each element of an array
// gcc -std=c11 -Wall -Wextra -pedantic -O3 callback.c -o callback_c
// ./callback_c 8192 1048576

// Preprocessor
#include <stdlib.h>

// Callback function
int function(int n, int m)
{
    return n + m;
}

// Benchmark function
int benchmark(int count, int size, int (*callback)(int, int))
{
  // Declares variables
  int* array = (int*)(malloc(size*sizeof(int)));
  int counter = 0, index = 0, sum = 0;
    
  // Fills the array with numbers
  for (index = 0; index < size; ++index) array[index] = index;

  // Calls the callbacks on each element of the array and loops over it
  for (counter = 0; counter < count; ++counter) {
    for (index = 1; index < size; ++index) {
      array[index] = callback(array[index - 1 ], array[index]);
    }
  }
    
  // Computes the sum of elements and returns it
  for (index = 0; index < size; ++index) sum += array[index];
  free(array);
  return sum;
}

// Main program
int main(int argc, char** argv)
{
  return argc * benchmark(atoi(argv[1]), atoi(argv[2]), function);
}
