#include "mylib.h"

int my_func1(int i) {
  if (i == 0)
    return i;
  if (i < 0)
    return -i / 2;

  return i / 2;
}

int my_func2(int i) {
  if (i <= 0)
    return -i * 2;
 
  return i * 2;
}
