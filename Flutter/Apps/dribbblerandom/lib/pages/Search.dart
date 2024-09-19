import 'package:flutter/material.dart';


class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [
          TabBar(
              isScrollable: true,
              labelStyle: TextStyle(fontSize: 18),
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 3
                  )
                )
              ),


              tabs: [

            Tab(text: "First"),
            Tab(text: "First"),
            Tab(text: "First"),
          ])
        ],
      ),
    );
  }
}
