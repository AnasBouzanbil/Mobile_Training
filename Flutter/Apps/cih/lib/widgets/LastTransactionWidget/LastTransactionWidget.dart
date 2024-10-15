import 'package:cih/Data/LastTransiction/lastTransiction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class LastTransactionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // Fixed height for the widget
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Horizontal scrolling for items
        padding: const EdgeInsets.only(top: 8),
        itemCount: transactions.length, // Ensure you have a transactions list
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey, width: 0.25),
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
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Align(
                      alignment: Alignment.center,
                      widthFactor: 1.0,
                      child: transactions[index].price ?? Container(),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: ClipOval(
                      child: transactions[index].img,
                    ),
                  ),
                  const Spacer(),
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
