import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionData {
  String transaction;
  String price;
  String date;
  String exactTime;
  Icon icon;

  TransactionData({
    required this.transaction,
    required this.price,
    required this.date,
    required this.exactTime,
    required this.icon,
  });
}

double iconSize = 24.0;

List<TransactionData> transactionData = [
  TransactionData(
    transaction: "Recharge Inwi",
    price: "100 MAD",
    date: "Today",
    exactTime: "10:45",
    icon: Icon(
      CupertinoIcons.arrow_up,
      color: Colors.red,
      size: iconSize,
    ),
  ),
  TransactionData(
    transaction: "Marjane Grocery",
    price: "200 MAD",
    date: "Today",
    exactTime: "11:45",
    icon: Icon(
      CupertinoIcons.arrow_up,
      color: Colors.red,
      size: iconSize,
    ),
  ),
  TransactionData(
    transaction: "Assurance Refund",
    price: "200 MAD",
    date: "Yesterday",
    exactTime: "04:45",
    icon: Icon(
      CupertinoIcons.arrow_down,
      color: Colors.green,
      size: iconSize,
    ),
  ),
  TransactionData(
    transaction: "Label'Vie Shopping",
    price: "150 MAD",
    date: "Yesterday",
    exactTime: "13:30",
    icon: Icon(
      CupertinoIcons.arrow_up,
      color: Colors.red,
      size: iconSize,
    ),
  ),
  TransactionData(
    transaction: "Netflix Subscription",
    price: "70 MAD",
    date: "Two days ago",
    exactTime: "08:00",
    icon: Icon(
      CupertinoIcons.arrow_up,
      color: Colors.red,
      size: iconSize,
    ),
  ),
  TransactionData(
    transaction: "ONEE Electricity Bill",
    price: "300 MAD",
    date: "Three days ago",
    exactTime: "09:15",
    icon: Icon(
      CupertinoIcons.arrow_up,
      color: Colors.red,
      size: iconSize,
    ),
  ),
  TransactionData(
    transaction: "IAM Phone Bill",
    price: "100 MAD",
    date: "Four days ago",
    exactTime: "12:00",
    icon: Icon(
      CupertinoIcons.arrow_up,
      color: Colors.red,
      size: iconSize,
    ),
  ),
  TransactionData(
    transaction: "Carrefour Purchase",
    price: "90 MAD",
    date: "Five days ago",
    exactTime: "18:30",
    icon: Icon(
      CupertinoIcons.arrow_up,
      color: Colors.red,
      size: iconSize,
    ),
  ),
  TransactionData(
    transaction: "BMCE Transfer Received",
    price: "250 MAD",
    date: "Five days ago",
    exactTime: "06:45",
    icon: Icon(
      CupertinoIcons.arrow_down,
      color: Colors.green,
      size: iconSize,
    ),
  ),
  TransactionData(
    transaction: "Taxi Payment",
    price: "20 MAD",
    date: "Six days ago",
    exactTime: "22:00",
    icon: Icon(
      CupertinoIcons.arrow_up,
      color: Colors.red,
      size: iconSize,
    ),
  ),
  TransactionData(
    transaction: "CIH Transfer Received",
    price: "500 MAD",
    date: "Last week",
    exactTime: "15:00",
    icon: Icon(
      CupertinoIcons.arrow_down,
      color: Colors.green,
      size: iconSize,
    ),
  ),
  TransactionData(
    transaction: "Flight Ticket",
    price: "1200 MAD",
    date: "Last month",
    exactTime: "05:30",
    icon: Icon(
      CupertinoIcons.arrow_up,
      color: Colors.red,
      size: iconSize,
    ),
  ),
  TransactionData(
    transaction: "Moroccan Dining Out",
    price: "180 MAD",
    date: "Last month",
    exactTime: "19:45",
    icon: Icon(
      CupertinoIcons.arrow_up,
      color: Colors.red,
      size: iconSize,
    ),
  ),
];
