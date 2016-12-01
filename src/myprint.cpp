#include <iostream>
#include "myprint.h"
using namespace std;

void my_print(const char* str) {
  while (*str)
    cout.put(*str++);

  cout.put('\n');
}