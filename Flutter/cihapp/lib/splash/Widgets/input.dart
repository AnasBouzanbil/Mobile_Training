import 'package:cihapp/presentaiton/Conf/Provider/Provider.dart';
import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
    TextEditingController controller;
  UserInput({super.key,
  required this.controller,
  });

  final LocaleProvider _localeProvider = LocaleProvider();

  @override
  Widget build(BuildContext context) {
    controller.text = "1548793";

    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30),
      child: Container(
        height: screenHeight * 0.07,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: TextField(
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, letterSpacing: 1),

              controller: controller,

              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_3_sharp),

                suffixIcon: IconButton(onPressed: (){controller.text = "";},
                    icon: Icon(Icons.clear, color: Colors.orangeAccent,)),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                labelText: "Demo Client",
                labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18), // Optional: Customize label style

                contentPadding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 10.0), // Adjust top padding for space between label and input
                floatingLabelBehavior: FloatingLabelBehavior.auto
              ),
            ),
          ),
        ),


      ),
    );
  }
}


class PasswordInput extends StatefulWidget {
  TextEditingController pass;
  PasswordInput({
    required  this.pass,
    super.key});


  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class require {
}

class _PasswordInputState extends State<PasswordInput> {

  final LocaleProvider _localeProvider = LocaleProvider();
  var _ocsucre = false;

  @override
  Widget build(BuildContext context) {
    widget.pass.text = "1548793";

    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30),
      child: Container(
        height: screenHeight * 0.07,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: TextField(
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, letterSpacing: 1),

              controller: widget.pass,
                obscureText: _ocsucre,

              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),

                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _ocsucre = !_ocsucre;

                        });
                        },
                      icon: Icon(
                        _ocsucre ? Icons.visibility : Icons.visibility_off
                        , color: Colors.orangeAccent,)),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18), // Optional: Customize label style
                  hintText: "Password",
                  contentPadding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 10.0), // Adjust top padding for space between label and input

              ),
            ),
          ),
        ),


      ),
    );
  }
}
