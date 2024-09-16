import 'package:flutter/material.dart';
import 'package:untitled1/services/Auth/auth_service.dart';
import 'package:untitled1/Pages/Login.dart';
import 'package:untitled1/components/Button.dart';
import 'package:untitled1/components/TextFiled.dart';
import 'package:untitled1/components/Toast.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final TextEditingController emailctrl = TextEditingController();
final TextEditingController passctrl = TextEditingController();
final TextEditingController cpassctrl = TextEditingController();

void signup() async {
  try {
    if (passctrl.text != cpassctrl.text) {
      showToast('Passwords do not match', Colors.red);
      return;
    }
    final auth = Authservice();
    await auth.SignupWithEmailAndPass(emailctrl.text, passctrl.text);
    showToast('Congratulations, your account has been created!', Colors.green);
  } catch (e) {
    showToast('Unexpected error during signup: ${e.toString()}', Colors.red);
  }
}

class Register extends StatelessWidget {
  final void Function()? toggle;

  Register({super.key, required this.toggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Colors.cyan,
            ),
            SizedBox(height: 50),
            Text(
              'Create a new account',
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextFiledI(
              hintTextt: 'Email',
              controller: emailctrl,
            ),
            SizedBox(height: 15),
            TextFiledI(
              hintTextt: 'Password',
              obscur: true,
              controller: passctrl,
            ),
            SizedBox(height: 15),
            TextFiledI(
              hintTextt: 'Confirm Password',
              obscur: true,
              controller: cpassctrl,
            ),
            SizedBox(height: 20),
            MyButton(
              textbutton: 'Sign Up',
              onTap: signup,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                GestureDetector(
                  onTap: toggle,
                  child: Text(
                    'Login now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
