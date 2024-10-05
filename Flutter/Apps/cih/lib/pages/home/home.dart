import 'package:cih/Data/LastTransiction/lastTransiction.dart';
import 'package:cih/widgets/AppBar/Appbar.dart';
import 'package:cih/widgets/HomeBody/HomeBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:flutter_any_logo/gen/assets.gen.dart';



class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: Appbar(),
      body: Body(),
      drawer: Drawer(
          child: Text("data")
      ),

    );
  }
}



