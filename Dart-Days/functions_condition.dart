class Solution {
  int romanToInt(String s) {
    int numser = 0;
    for (int i = 0; i < s.length; i++) {
      if (s[i] == 'C' && s[i + 1] == 'D') {
        i++;
        numser += 400;
      } else if (s[i] == 'C' && s[i + 1] == 'M') {
        numser += 900;
        i++;
      } else if (s[i] == 'C')
        numser += 100;
      else if (s[i] == 'I' && s[i + 1] == 'V') {
        numser += 4;
        i++;
      } else if (s[i] == 'I' && s[i + 1] == 'X') {
        i++;
        numser += 9;
      } else if (s[i] == 'I')
        numser += 1;
      else if (s[i] == 'V') {
        numser += 5;
      } else if (s[i] == 'L')
        numser += 50;
      else if (s[i] == 'D')
        numser += 500;
      else if (s[i] == 'M') {
        numser += 1000;
      } else if (s[i] == 'X' && s[i + 1] == 'L') {
        numser += 40;
        i++;
      } else if (s[i] == 'X' && s[i + 1] == 'C') {
        i++;
        numser += 90;
      } else if (s[i] == 'X') numser += 10;
    }
    return numser;
  }
}

int this_is_a_function() {
  print("I am a function and I am called. I will return the value 5.");
  return 5;
}

void boolean() {
  bool isTrue = true;
  bool isFalse = false;
  print(isTrue);
  print(isFalse);
}

void main() {
  Solution s = new Solution();
  print(s.romanToInt("MCMXCIV"));
  
  print('The value of the function is ${this_is_a_function().toString()}');

  print(add(54, 10));
}

int add(int a, int b) => a + b;

/*
  this  day is about the  learn the condition and calling function and cretaing a class and creating an object from the class
  to do this i went to leetcode and i solved a problem called roman to integer
  it was a good one to start with
  also it was a good opertunity to learn about dynamic and static variables and the difference between them
  and i was bot knowing that dart support arrow function as javascript

*/ 