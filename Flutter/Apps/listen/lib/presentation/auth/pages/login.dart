



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listen/common/helpers/is_dark_mode.dart';
import 'package:listen/common/widgets/appbar/appbar.dart';
import 'package:listen/common/widgets/button/basic_app_button.dart';
import 'package:listen/core/assets/app_vectors.dart';
import 'package:listen/presentation/auth/pages/signup.dart';


class Login extends StatelessWidget {

   TextEditingController email = TextEditingController();
   TextEditingController pass = TextEditingController();
   Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : MiniAppbar(
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
              LoginText(),
              SizedBox(height: 60),
              InputFiled(controller: email, hintText: "email"),
              SizedBox(height:25,),
              PassInputFiled(controller: pass),
              SizedBox(height:35,),

              BasicAppButton(child: Text("Login"), pressed: (){})


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
           "Do not have an account?",
           style: TextStyle(
             fontWeight: FontWeight.w500,
             fontSize: 14,
           ),
         ),
         TextButton(
           onPressed: () {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => Signup()),
             );
           },
           child: Text(
             "Regsiter now",
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
  Widget LoginText()
  {
    return  Column(
      children: [
        Text("Login",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),),

      ],
    );

  }


}
