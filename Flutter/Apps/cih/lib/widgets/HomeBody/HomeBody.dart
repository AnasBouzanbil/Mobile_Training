import 'package:cih/Data/LastTransiction/lastTransiction.dart';
import 'package:cih/widgets/BalanceAndCard/BalanceAndCard.dart';
import 'package:cih/widgets/LastTransactionWidget/LastTransactionWidget.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: SingleChildScrollView(  // Wrap the entire Column in a scrollable view
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            recentTransaction(formattedDate),
            const SizedBox(height: 20), // Spacing between elements
            LastTransactionWidget(),
            const SizedBox(height: 40),
            const BalanceAndCard(),
            const SizedBox(height: 20),
            OptionsGrid(),
          ],
        ),
      ),
    );
  }


  Column OptionsGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: GridElements()), // Makes this element expand to available width
            SizedBox(width: 10), // Spacing between the elements
            Expanded(child: GridElements()), // Second element also expands
          ],
        ),
        SizedBox(height: 10), // Space between the rows
        Row(
          children: [
            Expanded(child: GridElements()), // Same for the second row
            SizedBox(width: 10),
            Expanded(child: GridElements()),
          ],
        ),
  ]
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
        border: Border.all(color: Colors.grey, width: 0.25),



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