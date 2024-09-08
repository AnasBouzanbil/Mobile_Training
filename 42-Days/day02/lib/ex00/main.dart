import 'package:flutter/material.dart';


// class Today extends StatefulWidget {
//   const Today({super.key});
//
//   @override
//   State<Today> createState() => _TodayState();
// }
//
// class _TodayState extends State<Today> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }



class Ex00 extends StatefulWidget {
  const Ex00({super.key});

  @override
  State<Ex00> createState() => _Ex00State();
}



class _Ex00State extends State<Ex00> {

  int myindex = 0;
  final  _searchController = TextEditingController();
  String searched = "";

  @override
  void dispose() {
    _searchController.dispose(); // Clean up the controller when the widget is removed
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> widg = [
      Text("Today\n  " + searched, style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900)),
      Text("Tomorrow\n  " + searched, style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
      Text("next month\n  " + searched, style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900))
    ];
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centers the icons
          children: [
            Expanded(
              child: Container(
                height: 40, // Adjust the height of the search bar
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white, // Search bar background color
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: TextField(
                  controller: _searchController, // Assign the controller here

                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none, // Remove the border
                    // Use suffixIcon for an interactive icon
                    suffixIcon: IconButton(
                      onPressed: () {

                        setState(() {
                          // Handle the search action here
                           searched = _searchController.text;
                          print('Searched text: $searched'); // Debug print
                        });
                      },
                      icon: Icon(Icons.search), // Search icon
                    ),
                  ),
                ),
              ),
            ),
            VerticalDivider(
              color: Colors.black, // Divider color (adjust to your theme)
              thickness: 5,        // Divider thickness
              width: 20,           // Space between the search bar and the icon
            ),
            Icon(Icons.map),
          ],
        ),
      ),


      body: Center(

          child:  widg[myindex]
      ),
      bottomNavigationBar: BottomNavigationBar(

        onTap: (index){
  setState(() {
    myindex = index;
  });

        },
        currentIndex: myindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Currently: ' , // Display the searched text
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Tomorrow: ' , // Display the searched text
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Settings: ' , // Display the searched text
          ),
        ],
      ),
    );
  }
}
