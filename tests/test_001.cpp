#include <iostream>
#include "mylib.h"

using namespace std;

int main() {
  cout << my_func1(10) << endl;
  cout << my_func1(0) << endl;
  cout << my_func1(-1) << endl;

  cout << my_func2(10) << endl;
  cout << my_func2(-1) << endl;
  return 0;
}