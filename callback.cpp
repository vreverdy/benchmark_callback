// GPLv2 license - V. Reverdy - November 2015 
// Executes n times a loop calling a callback on each element of an array
// g++ -std=c++11 -Wall -Wextra -pedantic -O3 callback.cpp -o callback_cpp
// ./callback_cpp 8192 1048576

// Preprocessor
#include <cstdlib>
#include <utility>

// Benchmark function
template <class T>
int benchmark(int count, int size, T&& callback)
{
  // Declares variables
  int* array = (int*)(malloc(size*sizeof(int)));
  int counter = 0, index = 0, sum = 0;
    
  // Fills the array with numbers
  for (index = 0; index < size; ++index) array[index] = index;

  // Calls the callbacks on each element of the array and loops over it
  for (counter = 0; counter < count; ++counter) {
    for (index = 1; index < size; ++index) {
      array[index] = std::forward<T>(callback)(array[index - 1], array[index]);
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
  auto function = [](int n, int m){return n + m;};
  return argc * benchmark(atoi(argv[1]), atoi(argv[2]), function);
}
