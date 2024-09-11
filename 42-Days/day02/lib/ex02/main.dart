import 'package:flutter/material.dart';

class Ex02 extends StatefulWidget {
  const Ex02({super.key});

  @override
  State<Ex02> createState() => _Ex02State();
}

class _Ex02State extends State<Ex02> {
 static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
   'BANANA',
   'hOLYA',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Container(
          child: Autocomplete(
              optionsBuilder: (TextEditingValue value){
                return _kOptions.where((String opt){
                    return opt.toLowerCase().contains(value.text.toLowerCase());
                }
              );
            },
            onSelected: (String Selected){
                print(Selected);
        },
            fieldViewBuilder: (BuildContext context,  TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted){
                return TextField(

                );
            }
          ),
            ),

        ),
      );

  }
}
