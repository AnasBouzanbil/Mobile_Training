class Obj {
  int num = 5;
  String name = "ahmed";

  void memeber_function() {
    print("I am a member function");
  }

  no_param(String name, int num) {
    print("I am a default constructor");
    this.name = name;
    this.num = num;
  }
}

void cretaign_print_list() {
  print("Creating and printing a list");
  List one = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print(one);
}

void indexing_in_list() {
  print("Indexing in list");
  List one = [1, 54, 700, "ahmed", "ali"];
  print(one[0] + one[1]);
  try {
    print(one[3] + one[1]);
  } catch (e) {
    print(e);
  }
  try {
    throw Exception("This is an exception");
    print("not gonna print");
  } catch (e) {
    print(e);
  }
}

void loop_in_list() {
  print("Loop in list");
  List one = [1, 54, 700, "ahmed", "ali"];
  for (int i = 0; i < one.length; i++) {
    print(one[i]);
  }
}

void list_of_data_type() {
  print("List of data type");
  List<int> one = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 6];
  print(one);
  try {
    one.add(11111111111);
    print(one);
  } catch (e) {
    print(e);
  }
  print(one.isEmpty);
  print(one.isNotEmpty);
  print(one.length);
  print(one.first);
  print(one.last);

  one.remove(6);
  one.remove(6);

  print(one.reversed);
}

void creating_objects() {
  Obj obj = Obj();
  print(obj.num);
  obj.memeber_function();
}

class child extends Obj {
  int y = 87;
  child() {
    y = 4;
    print("I am a child constructor");
  }
}

void inheritance() {}

void main() {
  //List
  cretaign_print_list();
  indexing_in_list();
  loop_in_list();
  list_of_data_type();
  //My objects
  creating_objects();
  //Inheritance
  child c = child();
  c.memeber_function();
  print(c.y);
}

/*
the thrid day with Dart . 


This day I learned how to create a list and how to iterate through it.
I also familiarized myself with the potential errors that can occur during iteration and how to handle them using try, catch, and throw exceptions.

This experience helped me understand the workings of lists in Dart more deeply.
this day also helps me to learn the syntax of cretaing class with constructor and how to create an object from this class and how to call the member function of this class
and also the basics syntax of inheritance in dart

*/
