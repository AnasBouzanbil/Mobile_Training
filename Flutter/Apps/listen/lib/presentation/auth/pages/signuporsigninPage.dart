import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listen/common/widgets/button/basic_app_button.dart';
import 'package:listen/core/assets/app_images.dart';
import 'package:listen/core/assets/app_vectors.dart';
import 'package:listen/core/config/theme/app_colors.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

                // Align(
                //   alignment: Alignment.topCenter,
                //   child: SvgPicture.asset(appVector.logo),
                // ),
                Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(appVector.toppattern),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset(appVector.bottompattern),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(appImages.auth_bg),
                ),
          Align(
            alignment: Alignment.center,

            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(appVector.logo),
                  SizedBox(height: 20,),
                  Text("Enjouy Listening to Music ", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),),
                  SizedBox(height: 10,),
                    Text("Lieteningfiy is apopular app that provieds a range of music foe youn to listending isn sdn  in agood way ", style: TextStyle(
                      color: AppColors.grey,
                    ),
                    textAlign: TextAlign.center,),
                  SizedBox(height: 30,),
                  Row(

                    children: [
                      Expanded(flex: 1, child: BasicAppButton(child: Text("Register"), pressed: (){
                      })),
                      SizedBox(width: 15,),

                      Expanded(flex: 1, child: BasicAppButton(child: Text("Login"), pressed: (){
                      },)),
                    ],
                  )

                ],
              ),
            ),

          )
              ],
            ),



    );
  }
}
