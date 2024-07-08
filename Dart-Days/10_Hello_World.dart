import "dart:io";

void main()
{
    int i = 0;
    String name = "Hello World";

    while(i < 10)
    {
        print("The strign is " + name);
        print("the lenght is " + name.length.toString());
    
        i++;
    }
    name = "Finished";
    print(name);
    print("I want to get some input from you");
    String? input = stdin.readLineSync();
    print("I did a sync read and i get some input from you");

    print("You entered: $input");

}




/*
      The First Day with Dart
  Dart is a programming language developed by google 

  it is used especially for developing mobile apps and web apps

  First i get a inspirtion to get started wiith mobile app development
  so i found that there is many languages that can be used to develop mobile apps

  i found that there is a language called flutter that can be used to develop mobile apps
  it heared that it is a good language to develop mobile apps and it is easy to learn
  and who do not like easy things
  so i take the decision to learn flutter
  the first step to learn flutter is to learn dart
  because flutter is based on dart
  and becaiuse of i am interseted to be a dart developer i decided to learn just the basics of dart like the syntax of conditionals and loops and functions and classes and objects


  so i started this . you may think of it like days of execrise i learn something new everyday and i write it here



  i hope one day to be a web/mobile developer.
*/