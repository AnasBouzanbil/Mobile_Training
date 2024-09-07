import 'package:flutter/material.dart';
import 'package:movieapp/main.dart';

class Stack<T> {
  final List<T> _stack = [];

  void push(T element) {
    _stack.add(element);
  }

  T pop() {
    if (_stack.isEmpty) {
      throw StateError("No elements in the Stack");
    } else {
      T lastElement = _stack.last;
      _stack.removeLast();
      return lastElement;
    }
  }

  int length() {
    return _stack.length;
  }

  T top() {
    if (_stack.isEmpty) {
      throw StateError("No elements in the Stack");
    } else {
      return _stack.last;
    }
  }

  void clear() {
    _stack.clear();
  }

  bool isEmpty() {
    return _stack.isEmpty;
  }

  @override
  String toString() => _stack.join(''); // Join the stack items to form a string
}

class Culc extends StatefulWidget {
  const Culc({super.key});

  @override
  State<Culc> createState() => _CulcState();
}

class _CulcState extends State<Culc> {
  var input = Stack<String>();
  List<String> inputDisplay = [];
  String outputShowing = "";
  String output = "";
  bool isLastOperator = false;

  final List<String> calculatorButtons = [
    '7', '8', '9', '/',
    '4', '5', '6', '*',
    '1', '2', '3', '-',
    '0', '.', '=', '+',
    'C'
  ];

  void onButtonPressed(String value) {
    print("Button pressed: $value"); // Debugging print

    setState(() {
      if (value == 'C') {
        input.clear();
        output = "";
        outputShowing = "";
        inputDisplay.clear();
        print("Cleared input"); // Debugging print
      } else if (value == '=') {
        try {
          final result = _calculate();
          output = result.toString();
          input.clear();
          // output = "";
          inputDisplay.clear();

        } catch (e) {
          output = "Error";
        }
        print("Calculation result: $output"); // Debugging print
        input.clear();
      } else if (_isOperator(value)) {
        if (!isLastOperator && input.length() > 0) {
          input.push(value);
          inputDisplay.add(value);
          print("Operator added: $value"); // Debugging print
          isLastOperator = true;
        }
      } else {
        if (isLastOperator && input.length() >= 2) {
          inputDisplay.add(value);
          _performOperation(value);
        } else {
          input.push(value);
          inputDisplay.add(value);
          print("Number added: $value"); // Debugging print
        }
        isLastOperator = false;
      }
    });
  }

  bool _isOperator(String value) {
    return value == '+' || value == '-' || value == '*' || value == '/';
  }

  void _performOperation(String value) {
    var expression = input.pop();
    int number = int.parse(input.pop());

    int newValue;
    switch (expression) {
      case '+':
        newValue = number + int.parse(value);
        break;
      case '-':
        newValue = number - int.parse(value);
        break;
      case '*':
        newValue = number * int.parse(value);
        break;
      case '/':
        if (int.parse(value) == 0) {
          output = "Error (Div by 0)";
          input.clear();
          inputDisplay.clear();
          print("Division by zero error");
          return;
        }
        newValue = number ~/ int.parse(value); // Integer division
        break;
      default:
        print("Invalid operator");
        return;
    }

    input.push(newValue.toString());
    print("Intermediate result: $newValue"); // Debugging print
  }

  String _calculate() {
    if (input.isEmpty()) {
      return "0";
    }
    return input.top();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonSize = screenWidth / 4; // Button size

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyApp()),
          );

        },
        icon: Icon(Icons.arrow_back_ios_new),
      ),
        backgroundColor: Colors.blue,
        centerTitle: true,
          title: Text("Exercise 03: It’s alive!",
        style: TextStyle(
          color: Colors.black
        ),
        )


      ),
      body: SafeArea(
        child: Column(
          children: [
            Inputfileds(),
            Outputfildes(),
            Buttonsfileds(buttonSize),
          ],
        ),
      ),
    );
  }

  Expanded Buttonsfileds(double buttonSize) {
    return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Number of columns
                childAspectRatio: 1.0, // Aspect ratio of each item
              ),
              itemCount: calculatorButtons.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: buttonSize,
                  height: buttonSize,
                  child: buildButton(calculatorButtons[index]),
                );
              },
            ),
          );
  }

  Container Outputfildes() {
    return Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(16),
            child: Text(
              output,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.end,
            ),
          );
  }

  Container Inputfileds() {
    return Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(16),
            child: Text(
              inputDisplay.join(' '),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.end,
            ),
          );
  }

  Widget buildButton(String value) {
    return TextButton(
      child: Center(
        child: Text(
          value,
          style: const TextStyle(
            backgroundColor: Colors.white60,
            color: Colors.black,
            fontSize: 24, // Adjust font size as needed
          ),
        ),
      ),
      onPressed: () => onButtonPressed(value),
    );
  }
}
