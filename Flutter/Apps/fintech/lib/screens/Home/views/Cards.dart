import 'package:fintech/screens/Home/views/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditCardsPage extends StatefulWidget {
  const CreditCardsPage({Key? key}) : super(key: key);

  @override
  State<CreditCardsPage> createState() => _CreditCardsPageState();
}

class _CreditCardsPageState extends State<CreditCardsPage> {
  bool isSwitched = false;
  bool isSwitched2 = false;

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
            MaterialPageRoute(builder: (context) => const Homescreen()),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "My Cards",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 255, 124, 48),
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 20),
              _buildCreditCard(
                color: const Color(0xFF090943),
                cardExpiration: "08/2027",
                cardHolder: "Diego Dee",
                cardNumber: "3546 7532 XXXX 9742",
              ),
              SizedBox(height: 10,),
              
              const SizedBox(height: 15),
        
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                   _buildToggleContainer(),
                  const SizedBox(height: 10),
                  
                  _buildActionButton(
                    icon: Icons.money_outlined,
                    label: "Withdrawal",
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
                  _buildActionButton(
                    icon: Icons.credit_card,
                    label: "Payment by card",
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
                  _buildActionButton(
                    icon: Icons.shopping_basket_outlined,
                    label: "Online payment",
                    onTap: () {},
                  ),
                   const SizedBox(height: 10),
                  _buildActionButton(
                    icon: Icons.plus_one,
                    label: "Add a card",
                    onTap: () {},
                  ),
                  const SizedBox(height: 15),
                  
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 173, 173, 173),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.contactless, color: Colors.white),
                          const SizedBox(width: 10),
                          const Text("Contactless payment"),
                          const Spacer(),
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                            activeColor: Colors.green,
                            inactiveThumbColor: Colors.red,
                            inactiveTrackColor: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
             Container(
              width: double.infinity,

              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.qrcode,),
                    SizedBox(width: 10,),
                    Text("OPPOSE MY CARD",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16
                    ),
                    )
                  ],
                ),
              ),
             )
            ],
          ),
        ),
        
      ),
    );
  }

  Widget _buildCreditCard({
    required Color color,
    required String cardNumber,
    required String cardHolder,
    required String cardExpiration,
  }) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildLogosBlock(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                cardNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontFamily: 'CourierPrime',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildDetailsBlock(label: 'CARDHOLDER', value: cardHolder),
                _buildDetailsBlock(label: 'VALID THRU', value: cardExpiration),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset("assets/contact_less.png", height: 20, width: 18),
        Image.asset("assets/mastercard.png", height: 50, width: 50),
      ],
    );
  }

  Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 9,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Icon(icon, color: Colors.blue),
              const SizedBox(width: 15),
              Text(label),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleContainer() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 173, 173, 173),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            const Icon(Icons.kitchen, color: Colors.white),
            const SizedBox(width: 10),
            const Text("Contactless payment"),
            const Spacer(),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
              inactiveTrackColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
