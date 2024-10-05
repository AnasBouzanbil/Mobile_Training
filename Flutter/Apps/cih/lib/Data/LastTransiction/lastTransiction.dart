import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:flutter_any_logo/gen/assets.gen.dart';

class LastTransaction {
  Widget? typeOfTransaction; // Fixed spelling
  Widget? price;
  Widget? img; // Change from Image? to Widget?
  Widget? date;

  LastTransaction({
    required this.img,
    required this.price,
    required this.typeOfTransaction, // Fixed spelling
    required this.date,
  });
}

// Updated list of transactions
List<LastTransaction> transactions = [
  LastTransaction(
    img: AnyLogo.fashion.bershka.image(),
    price: Text("-60Dh", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    typeOfTransaction: Text(
      "ATM Withdrawal",
      overflow: TextOverflow.ellipsis, // Use ellipsis for overflow
      maxLines: 1, // Limit to one line
      style: TextStyle(fontSize: 14), // Adjust font size as needed
    ),
    date: Text("12/07/2024", style: TextStyle(fontSize: 10, )),
  ),
  LastTransaction(
    img: AnyLogo.daily.kfc.image(),
    price: Text("-30Dh", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300)),
    typeOfTransaction: Text(
      "Food Purchase",
      overflow: TextOverflow.ellipsis, // Use ellipsis for overflow
      maxLines: 1, // Limit to one line
      style: TextStyle(fontSize: 14), // Adjust font size as needed
    ),
    date: Text("11/07/2024", style: TextStyle(fontSize: 8)),
  ),
  LastTransaction(
    img: AnyLogo.daily.starbucks.image(),
    price: Text("-15Dh", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300)),
    typeOfTransaction: Text(
      "Coffee",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontSize: 14),
    ),
    date: Text("10/07/2024", style: TextStyle(fontSize: 8)),
  ),
  LastTransaction(
    img: AnyLogo.tech.paypal.image(),
    price: Text("+500Dh", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w300)),
    typeOfTransaction: Text(
      "Salary Deposit",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontSize: 14),
    ),
    date: Text("09/07/2024", style: TextStyle(fontSize: 8)),
  ),
  LastTransaction(
    img: AnyLogo.fashion.chanel.image(),
    price: Text("-120Dh", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300)),
    typeOfTransaction: Text(
      "Online Shopping",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontSize: 14),
    ),
    date: Text("08/07/2024", style: TextStyle(fontSize: 8)),
  ),
  LastTransaction(
    img: AnyLogo.media.netflix.image(),
    price: Text("-50Dh", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300)),
    typeOfTransaction: Text(
      "Subscription Fee",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontSize: 14),
    ),
    date: Text("07/07/2024", style: TextStyle(fontSize: 8)),
  ),
  LastTransaction(
    img: AnyLogo.daily.cocaCola.image(),
    price: Text("-25Dh", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300)),
    typeOfTransaction: Text(
      "Drink Purchase",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontSize: 14),
    ),
    date: Text("06/07/2024", style: TextStyle(fontSize: 8)),
  ),
  LastTransaction(
    img: AnyLogo.fashion.hm.image(),
    price: Text("-80Dh", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300)),
    typeOfTransaction: Text(
      "Clothing Purchase",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontSize: 14),
    ),
    date: Text("05/07/2024", style: TextStyle(fontSize: 8)),
  ),
  LastTransaction(
    img: AnyLogo.fashion.nike.image(),
    price: Text("-150Dh", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300)),
    typeOfTransaction: Text(
      "Sports Gear Purchase",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontSize: 14),
    ),
    date: Text("04/07/2024", style: TextStyle(fontSize: 8)),
  ),
  LastTransaction(
    img: AnyLogo.fashion.adidas.image(),
    price: Text("-100Dh", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300)),
    typeOfTransaction: Text(
      "Shoes Purchase",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontSize: 14),
    ),
    date: Text("03/07/2024", style: TextStyle(fontSize: 8)),
  ),
  LastTransaction(
    img: AnyLogo.cricket.cscs.image(),
    price: Text("+200Dh", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w300)),
    typeOfTransaction: Text(
      "Cashback",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontSize: 14),
    ),
    date: Text("02/07/2024", style: TextStyle(fontSize: 8)),
  ),
  LastTransaction(
    img: AnyLogo.tech.google.image(),
    price: Text("-10Dh", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300)),
    typeOfTransaction: Text(
      "Cloud Storage Fee",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontSize: 14),
    ),
    date: Text("01/07/2024", style: TextStyle(fontSize: 8)),
  ),
  LastTransaction(
    img: AnyLogo.media.spotify.image(),
    price: Text("-35Dh", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300)),
    typeOfTransaction: Text(
      "Music Subscription",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontSize: 14),
    ),
    date: Text("30/06/2024", style: TextStyle(fontSize: 8)),
  ),
  LastTransaction(
    img: AnyLogo.tech.apple.image(),
    price: Text("-45Dh", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300)),
    typeOfTransaction: Text(
      "Professional Networking Fee",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontSize: 14),
    ),
    date: Text("29/06/2024", style: TextStyle(fontSize: 8)),
  ),
  LastTransaction(
    img: AnyLogo.daily.sodexo.image(),
    price: Text("-50Dh", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300)),
    typeOfTransaction: Text(
      "Promoted Pins",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontSize: 14),
    ),
    date: Text("26/06/2024", style: TextStyle(fontSize: 8)),
  ),
  LastTransaction(
    img: AnyLogo.tech.adobe.image(),
    price: Text("-90Dh", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300)),
    typeOfTransaction: Text(
      "Adobe Subscription",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontSize: 14),
    ),
    date: Text("25/06/2024", style: TextStyle(fontSize: 8)),
  ),
  // New transaction added
  LastTransaction(
    img: AnyLogo.daily.mcDonals.image(), // McDonald's logo
    price: Text("-40Dh", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300)),
    typeOfTransaction: Text(
      "Fast Food Purchase",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontSize: 14),
    ),
    date: Text("13/07/2024", style: TextStyle(fontSize: 8)),
  ),
];
