import 'package:campusplaus/HomePage/HomePage.dart';
import 'package:flutter/material.dart';



class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(

        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),

                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/output.gif"),
                ),
              ),
            ),


            Container(
                width: MediaQuery.of(context).size.width,

              decoration: const BoxDecoration(

              ),
              child:  Column(
                children: [
                  const SizedBox(
                    width: 270,
                    child: Text(
                      'Wherever you are hedalth is number one',
                      textAlign: TextAlign.center,
                      style: TextStyle(decoration: TextDecoration.none, fontSize: 24, color: Color(0xff192126), fontFamily: 'Lato-ExtraBold', fontWeight: FontWeight.w700),
                      maxLines: 9999,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    'There is no instant way to a healthy life',
                    textAlign: TextAlign.center,
                    style: TextStyle(decoration: TextDecoration.none, fontSize: 15, color: Color(0x7f192126), fontFamily: 'Lato-Regular', fontWeight: FontWeight.normal),
                    maxLines: 9999,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Homepage())
                      );
                    },

                    child: Container(
                      width: 350,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xff192126),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Get Started',
                        textAlign: TextAlign.center,


                        style: TextStyle(decoration: TextDecoration.none, fontSize: 16, color: const Color(0xffffffff), fontFamily: 'Lato-Bold', fontWeight: FontWeight.w800),
                        maxLines: 9999,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            )



          ],
        ),
      ),
    );
  }
}
