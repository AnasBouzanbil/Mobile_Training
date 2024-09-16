import 'package:flutter/material.dart';


class TextFiledI extends StatefulWidget {
 final String hintTextt;
 final bool obscur;
 final TextEditingController controller;
  const TextFiledI({

    super.key,
  required this.hintTextt,
    this.obscur = false,
    required this.controller,
  });

  @override
  State<TextFiledI> createState() => _TextFiledIState();
}

class _TextFiledIState extends State<TextFiledI> {
  @override
  Widget build(BuildContext context) {
    return  Padding(

      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        obscureText: widget.obscur,
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:  Colors.amberAccent, width: 2),

          ),
        fillColor: Colors.white70,
          focusColor: Colors.yellowAccent,
          filled: true,
          hintText: '${widget.hintTextt}'
        ),

      ),

    );
  }
}
