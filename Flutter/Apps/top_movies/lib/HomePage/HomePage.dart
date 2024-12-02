import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text("Trending "+" ❤️‍🔥 ",
                 style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 16
                 ),
                 ),
              ],
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([
            Center(
              child: Text("data"),
            )
          ]))
        ],
      ),
    );
  }
}