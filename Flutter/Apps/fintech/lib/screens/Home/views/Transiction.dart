
import 'package:fintech/Data/TransictionData.dart';
import 'package:fintech/screens/Home/views/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.grey.shade50,
        title: Image.asset("assets/cihavatar.jpeg", width: 60),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(CupertinoIcons.arrow_left),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homescreen()),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: [
            _buildAccountInfo(),
            SizedBox(height: 20),
            _buildTransactionHeader(),
            SizedBox(height: 20),
            Expanded(child: _buildTransactionList()),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child:  Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              _buildInfoRow("Account No", "1254981254034577", Colors.green),
              SizedBox(height: 5),
              _buildInfoRow("Balance", "4800.24 MAD", Colors.blue),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildInfoRow(String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: valueColor),
        ),
      ],
    );
  }

  Widget _buildTransactionHeader() {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "All Transactions",
          style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
    return ListView.builder(
      itemCount: transactionData.length,
      itemBuilder: (context, index) {
        final transaction = transactionData[index];
        return _buildTransactionItem(transaction);
      },
    );
  }

  Widget _buildTransactionItem(TransactionData transaction) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _buildIcon(transaction.icon),
              SizedBox(width: 15),
              _buildTransactionInfo(transaction),
              Spacer(),
              _buildTransactionDetails(transaction),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(Icon icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color.fromARGB(255, 103, 170, 224),
      ),
      child: icon,
    );
  }

  Widget _buildTransactionInfo(TransactionData transaction) {
    return Text(
      transaction.transaction,
      style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildTransactionDetails(TransactionData transaction) {
    return Column(
      children: [
        Text(
          transaction.price,
          style: TextStyle(
              color: const Color.fromARGB(255, 92, 92, 92),
              fontSize: 15,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 7),
        Text(
          transaction.date,
          style: TextStyle(
              color: const Color.fromARGB(255, 160, 159, 159),
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
        Text(
          transaction.exactTime,
          style: TextStyle(
              color: const Color.fromARGB(255, 160, 159, 159),
              fontSize: 10,
          ),
        ),
      ],
    );
  }
}
