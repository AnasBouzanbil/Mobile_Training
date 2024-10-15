


import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';







class BalanceAndCard extends StatefulWidget {
  const BalanceAndCard({super.key});

  @override
  State<BalanceAndCard> createState() => _BalanceAndCardState();
}

class _BalanceAndCardState extends State<BalanceAndCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 0.2,
        ),
        borderRadius: BorderRadius.circular(20), // Optional: adds rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start (left)
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                  children: [
                    Text("Checking Account", style: TextStyle(
                      fontWeight: FontWeight.w600,

                    ),),
                    SizedBox(height: 5,),
                    Text(
                      "**** **** **** 8561",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Transform.translate(
                  offset: Offset(0, 2), // Move the logo 10 pixels up
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: AnyLogo.tech.masterCard.image(),
                  ),
                ),
              ],
            ),
            SizedBox(height:20),

            Container(
              width: double.infinity,
              height: 0.2,
              color: Colors.grey.shade900,
            ),

            SizedBox(height:20),

            BalanceShow(),










          ],
        ),
      ),
    );
  }
}





class BalanceShow extends StatefulWidget {
  const BalanceShow({super.key});

  @override
  State<BalanceShow> createState() => _BalanceShowState();
}

class _BalanceShowState extends State<BalanceShow> {
  bool showBalance = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
          children: [
            Text("Balanace",
            style: TextStyle(
              fontWeight: FontWeight.w600,

            ),
            ),
            SizedBox(height: 5,),
            showBalance ? Text(
              "********",
              style: TextStyle(
                letterSpacing: 3.50, // Adjust the value for desired spacing

                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ):

            Text(
              showBalance ?  "********" :  "54872.12",
              style: TextStyle(
                letterSpacing: 1.2, // Adjust the value for desired spacing

                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

          ],
        ),
        Spacer(),
        Transform.translate(
          offset: const Offset(0, 2), // Move the logo 10 pixels up
          child: IconButton(onPressed: (){
            setState(() {
              showBalance = !showBalance;
            });

          }, icon:showBalance ? Icon(Icons.visibility_off_sharp) :  Icon(Icons.visibility_rounded)),
        ),
      ],
    );
  }
}
