import 'package:flutter/material.dart';
import 'package:untitled1/services/Auth/AUth_gate.dart';
import 'package:untitled1/services/Auth/auth_service.dart';
import 'package:untitled1/Pages/Register.dart';
import 'package:untitled1/components/Button.dart';
import 'package:untitled1/components/TextFiled.dart';
import 'package:untitled1/components/Toast.dart';

class LoginPage extends StatelessWidget {
  final void Function()? toggle;

  LoginPage({super.key, required this.toggle});

  final TextEditingController emailctrl = TextEditingController();
  final TextEditingController passctrl = TextEditingController();

  void Login() async {
    final authserv = Authservice();
    try {
      await authserv.SigninUsingPassEmail(emailctrl.text, passctrl.text);
      showToast('Hey, welcome back!', Colors.green);
      AuthGate();
    } catch (e) {
      showToast('Login failed: ${e.toString()}', Colors.red);
      emailctrl.text = "";
      passctrl.text = "";
    }
  }

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
              'Hey back, we have missed you!',
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 19),
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
            SizedBox(height: 20),
            MyButton(
              textbutton: 'Login',
              onTap: Login,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member?'),
                GestureDetector(
                  onTap: toggle,
                  child: Text(
                    'Register now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
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
