import 'package:cihapp/presentaiton/homePage/Widgets/BalanceDisplay/BalanceDIsplay.dart';
import 'package:cihapp/presentaiton/homePage/Widgets/UserDisplay/UserDisplay.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

import 'package:payment_card/payment_card.dart';


class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBatHomepage(),
      body: Padding(
        padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10),
        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const  Userdisplay(),
             const  SizedBox(height: 15,),
              const Text("My Account",

                style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
              ),
              ),
            const   SizedBox(height: 15,),
              Balancedisplay(),
              const  Text("My Cards",

                style:  TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
                const   SizedBox(height: 15,),
           const    Creaditcard(),
          const     SizedBox(height: 15,),
              HomeOptions(),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 35.0, right: 35, bottom: 20, top: 15),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow:
              [
                BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(
                    0.10,
                    0.10,
                  ),
                  blurRadius: 100.0,
                  spreadRadius: 0.001,
                ), //BoxShadow
                //BoxShadow
              ],

            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.insert_chart_outlined_sharp, color: Colors.orangeAccent,size: 40,),
              Spacer(),
              Icon(Icons.home, color: Colors.orangeAccent,size: 40,),
              Spacer(),

              Icon(Icons.person, color: Colors.orangeAccent,size: 40,),
              Spacer(),

              Icon(Icons.settings, color: Colors.orangeAccent,size: 40,),
            ],
          )
        ),
      )
    );
  }









  AppBar AppBatHomepage() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Image.asset("assets/images/Cih-bank.png", width: 170,),
      ),
      centerTitle: true,
    );
  }
}










class Creaditcard extends StatelessWidget {
  const Creaditcard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        width: 360,
        child: const PaymentCard(
          cardIssuerIcon: CardIcon(icon: Icons.credit_card),
          backgroundColor: Colors.blue,
          backgroundGradient: LinearGradient(
            colors: [Colors.purple, Colors.indigo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          currency: Text('CIH bank'),
          cardNumber: '*********3456',
          validity: '10/24',
          holder: 'Demo Client',
          isStrict: false,
          cardNetwork: CardNetwork.mastercard,
          cardTypeTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          cardNumberStyles: CardNumberStyles.darkStyle4,
          backgroundImage: null,

        ),
      ),
    );
  }
}


class HomeOptions extends StatelessWidget {
  const HomeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuildOptions(IconButton(onPressed: (){
          Fluttertoast.showToast(
            msg: 'Opps not implemented yet',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP, // Position at bottom
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );

        }, icon: Icon(Icons.receipt, color: Colors.orange)), "Pay Bills"),
        const SizedBox(width: 10,),
        BuildOptions(const Icon(Icons.transfer_within_a_station, color: Colors.orange), "Transfer"), // Transfer icon
        const  SizedBox(width: 10,),

        BuildOptions(const Icon(Icons.replay, color: Colors.orange), "Refill"), // Refill icon
        const  SizedBox(width: 10,),

        BuildOptions(const Icon(Icons.edit, color: Colors.orange), "Edit Shortcuts"), // Edit icon
      ],
    );
  }


  Flexible  BuildOptions(Widget icon, String text) {
    return  Flexible(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromRGBO(245, 186, 95, 0.70) ,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon, // Use the provided icon directly
              SizedBox(height: 5),
              Container(
                constraints: BoxConstraints(maxWidth: 100), // Set a max width to enable wrapping
                child: Text(
                  text, // Use the provided text directly
                  textAlign: TextAlign.center, // Center align the text
                  style: TextStyle(fontWeight: FontWeight.bold), // Customize font style
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
