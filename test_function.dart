// 06.13.과제
// 2번.

bool isEven(int value) {
  if (value % 2 == 0) {
    print('true');
    return true;
  } else {
    //print('false');
    return false;
  }
}

// 3번.
int findMax(List<int> value) {
  value.sort();
  return value.last;

  // return findMax(value);
}
