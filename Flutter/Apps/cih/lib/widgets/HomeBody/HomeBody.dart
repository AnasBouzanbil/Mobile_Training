import 'package:cih/Data/LastTransiction/lastTransiction.dart';
import 'package:cih/widgets/BalanceAndCard/BalanceAndCard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    final String formattedDate = formatter.format(now);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
      child: Column(
        children: [
          recentTransaction(formattedDate),
          _lastTransactionWidget(),
         const  SizedBox(height: 40),
         const  BalanceAndCard(),
         SizedBox(height: 10,),
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Row(
               children: [
                 GridElements(),
                 Spacer(),
                 GridElements(),
               ],

             ),
             SizedBox(height: 5,),
             Row(
               children: [
                 GridElements(),
                 Spacer(),
                 GridElements(),
               ],

             )
           ],
         )

        ],
      ),
    );
  }





  SizedBox _lastTransactionWidget() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 8),
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black, width: 0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.center,
                        widthFactor: 1.0,
                        child: transactions[index].typeOfTransaction ?? Container(),
                      ),
                    ),
                  ),
                  const  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Align(
                      alignment: Alignment.center,
                      widthFactor: 1.0,
                      child: transactions[index].price ?? Container(),
                    ),
                  ),
                const   SizedBox(height: 10),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: ClipOval(
                      child: transactions[index].img,
                    ),
                  ),
                const   Spacer(),
                  transactions[index].date ?? Container(),
                  const Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
Row recentTransaction(String formattedDate) {
  return Row(
    children: [
      const Text(
        "Recent Transaction: ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      Text(
        formattedDate,
        style: const  TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      const   Spacer(),
      TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.clear),
        label: const  Text("Clear"),
      ),
    ],
  );
}



Container GridElements()
{
  String text = "Pay Bills";
  Icon _icon = Icon(Icons.receipt);


  return Container(
    width: 218, // Set a specific width
    height: 90, // Set a specific height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 0.2),



    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon,
          SizedBox(width: 6,),
          Text(text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16
          ),),
        ],
      ),
    ),
  );
}