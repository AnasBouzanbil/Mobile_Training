import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listen/common/widgets/button/basic_app_button.dart';
import 'package:listen/core/assets/app_images.dart';
import 'package:listen/core/assets/app_vectors.dart';
import 'package:listen/core/config/theme/app_colors.dart';
import 'package:listen/presentation/choose_mode/pages/choose_mode.dart';


class Getstarted extends StatelessWidget {
  const Getstarted({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit : BoxFit.fill,
                image: AssetImage(appImages.get_started_bg),
              )
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child:  SvgPicture.asset(appVector.logo),
                ),

                Spacer(),
                Text('Enjoy Listening with Anasy',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 20,),
                Text('Enjoy Listening with Anasy Enjoy Listening with Anasy Enjoy Listening with Anasy Enjoy Listening with Anasy'
                    '',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: AppColors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30,),
                BasicAppButton(child: Text("Get Started"), pressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChooseMode(), // Replace with your target widget
                    ),);
                },),
                SizedBox(height: 30,)
              ],
            ),
          ),


        ],
      ),
    );
  }
}
