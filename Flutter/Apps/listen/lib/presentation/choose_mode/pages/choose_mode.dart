import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listen/common/widgets/button/basic_app_button.dart';
import 'package:listen/core/assets/app_images.dart';
import 'package:listen/core/assets/app_vectors.dart';
import 'package:listen/main.dart';
import 'package:listen/presentation/auth/pages/signuporsigninPage.dart';
import 'package:listen/presentation/choose_mode/bloc/theme_cubite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Stack(
        children: [
      Container(
         padding: const EdgeInsets.symmetric(
              vertical: 40,
               horizontal: 40
           ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                  fit : BoxFit.fill,
                  image: AssetImage(appImages.choose_mode),
              )
          ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child:  SvgPicture.asset(appVector.logo),
            ),
            const Spacer(),
            Text("Choose Mode",
              style:TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 44,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [

              GestureDetector(
                onTap: (){
                  context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                },
                child: ClipOval(
                  child: BackdropFilter(
                    filter : ImageFilter.blur(sigmaX: 10,sigmaY: 10)   ,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(0xff30393C).withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(appVector.sun, fit: BoxFit.fill,),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 30,),
              GestureDetector(
                onTap: (){
                  context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                },
                child: ClipOval(
                  child: BackdropFilter(
                    filter : ImageFilter.blur(sigmaX: 10,sigmaY: 10)   ,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(0xff30393C).withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(appVector.moon, fit: BoxFit.fill,),
                    ),
                  ),
                ),
              ),
            ],
            ),
            SizedBox(height: 60,),

            BasicAppButton(child: Text("Contuine"), pressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignupOrSigninPage() // Replace with your target widget
                ),);
            },),
            SizedBox(height: 30,)

          ]


        ),
      ),
        ],
      )
    );
  }
}
