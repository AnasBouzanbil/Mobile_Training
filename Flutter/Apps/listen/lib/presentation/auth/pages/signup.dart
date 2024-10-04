

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listen/common/widgets/appbar/appbar.dart';
import 'package:listen/common/widgets/button/basic_app_button.dart';
import 'package:listen/core/assets/app_vectors.dart';
import 'package:listen/presentation/auth/pages/login.dart';


class Signup extends StatelessWidget {
   Signup({super.key});
   final TextEditingController password = TextEditingController();
   final TextEditingController email = TextEditingController();
   final TextEditingController fullname = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MiniAppbar(
        title: Container(
          child: SizedBox(
            width: 100, // Adjust width as needed
            height: 60, // Adjust height as needed
            child: SvgPicture.asset(appVector.logo),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 30

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            _RegisterText(),
            SizedBox(height: 60),
            InputFiled(hintText: "Full Name ...", controller: fullname),
            SizedBox(height: 25),
            InputFiled(hintText: "Email", controller: email),
            SizedBox(height: 25),
            PassInputFiled(controller: password),
            SizedBox(height: 35),
            BasicAppButton(
              child: Text("Register"),
              pressed: () {},
              height: 70,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SignInBottomText(context),
    );
  }

   Widget SignInBottomText(BuildContext context) {
     return Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text(
           "Do you have an account?",
           style: TextStyle(
             fontWeight: FontWeight.w500,
             fontSize: 14,
           ),
         ),
         TextButton(
           onPressed: () {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => Login()),
             );
           },
           child: Text(
             "Login",
             style: TextStyle(
               fontWeight: FontWeight.w500,
               fontSize: 14,
               color: Colors.blue.shade500,
             ),
           ),
         ),
       ],
     );
   }

  Widget _RegisterText() {
    return Column(
      children: [
        const Text(
          'Register',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 18),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "If You need any support contact click ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {},
              child: Text(
                "here",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.blue.shade200,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

}




class InputFiled extends StatelessWidget {
  final TextEditingController controller;
  final String ? hintText;
  const InputFiled({

    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,

      decoration: InputDecoration(
        hintText: hintText,

      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}

class PassInputFiled extends StatefulWidget {
  final TextEditingController controller;
   PassInputFiled({
    super.key,
    required this.controller,
  });

  @override
  State<PassInputFiled> createState() => _PassInputFiledState();
}

class _PassInputFiledState extends State<PassInputFiled> {
   bool isshow = true;

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: widget.controller,


      obscureText: isshow,
      decoration: InputDecoration(
      suffixIcon: IconButton(onPressed: (){
       setState(() {
         isshow = !isshow;
       });
      }, icon: isshow ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
      ),

        hintText: 'Password',


      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}