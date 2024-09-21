import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listen/core/assets/app_vectors.dart';
import 'package:listen/presentation/intro/pages/getStarted.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    redirecttohome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: SvgPicture.asset(appVector.logo)),

    );

  }
  Future<void> redirecttohome() async
  {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext)=> Getstarted()));
  }
}
