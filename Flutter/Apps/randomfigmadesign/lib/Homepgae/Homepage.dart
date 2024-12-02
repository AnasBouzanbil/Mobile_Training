import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomfigmadesign/ContentPage/ContentPage.dart';
import 'package:randomfigmadesign/List/List.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 34),
        child: Column(
          children: [
             WelcomingWidgete(),
            const SizedBox(height: 40,),

            inputSearch(context),
            const SizedBox(height: 30,),

            buildRow(),
            const SizedBox(height: 30,),

            const MiniView(),
            const SizedBox(height: 30,),


        IMagesview()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: 0,
        onTap: (index) {
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_filled_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: '',
          ),
        ],
      ),

      

    );
  }

  Expanded IMagesview() {
    return Expanded(


        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: elements.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ContentPage(index: index)),
                    );
                    
                  },
                  child: Container(
                    width: 270,
                    height: 405,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      
                        image: DecorationImage(
                          image: AssetImage(elements[index].imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                  
                  child: Column(
                  
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade500,
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: Icon(Icons.favorite_border, color: Colors.white,),
                          ),
                        ),
                      ),
                  
                      Spacer(),
                      MountainsIMage(index),
                      
                    ],
                  ),
                  ),
                ),
              );

            }
        ),
      );
  }

  Padding MountainsIMage(int index) {
    return Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  width: 244,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.10),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            width: 244,
                            height: 75,
                            alignment: Alignment.center,
                           child: Padding(
                             padding: const EdgeInsets.only(top: 15, left: 15.0),
                             child: Column(
                               children: [
                                 Row(
                                   children: [
                                     Text(
                                       elements[index].mountainName + ", ",
                                       textAlign: TextAlign.left,
                                       style: TextStyle(decoration: TextDecoration.none, fontSize: 16, color: const Color(0xffffffff), fontFamily: 'RobotoRoman-Medium', fontWeight: FontWeight.normal),
                                       maxLines: 9999,
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                     Text(elements[index].country,
                                       style: TextStyle(
                                           fontSize: 14,
                                           color: Colors.white,
                                           fontWeight: FontWeight.w500
                                       ),

                                     )
                                   ],
                                 ),

                                 Row(
                                   children: const [
                                     Icon(Icons.location_on_outlined, size: 16, color: Colors.white,),
                                     SizedBox(width: 20,),
                                     Text(
                                        'Tokyo, Japan',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(decoration: TextDecoration.none, fontSize: 14, color: Color(0xffc9c8c8), fontFamily: 'RobotoRoman-Regular', fontWeight: FontWeight.normal),
                                        maxLines: 9999,
                                        overflow: TextOverflow.ellipsis,
                                        ),

                                   ],
                                 )
                               ],
                             ),
                           ),
                          ),
                        ],
                      ),
                    );
  }

  Row buildRow() {
    return Row(
            children: [
              Text(
                  "Popular places",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )
              ),

              const Spacer(),

              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(
                    msg: "Opps, Not Implemented yet",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    backgroundColor: Colors.cyan,
                    textColor: Colors.white,
                  );
                },
                child: Text(
                    "View all",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF888888)
                    )
                ),
              )
            ],
          );
  }

  Container inputSearch(BuildContext context) {
    return Container(
            width: MediaQuery.of(context).size.width / 1.02,
            height: 58,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFD2D2D2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: TextField(

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search places",
                        hintStyle: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 16
                        )


                      ),
                    ),
                  ),


                  Container(
                    height: 50,
                    width: 2,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xFF888888)
                    ),
                  ),
                  const SizedBox(width: 20,),

                  GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "Opps, Not Implemented yet",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                        );
                      },
                      child: SvgPicture.asset("assets/filter.svg"),
                  )
                  
                ],
              ),
            ),
          );
  }

  Row WelcomingWidgete() {
    return Row(

             children: [
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       const Text(
                          "Hi, David",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                       ),
                       SvgPicture.asset("assets/hand.svg",
                       width: 30,
                       ),

                     ],
                   ),

                   const SizedBox(height: 10,),
                   const Text(
                       "Explore the world",
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.w500,
                         color: Color(0xFF888888),
                         letterSpacing: 0.4
                       )
                   )
                 ],
               ),
               const Spacer(),

               Container(
                 width: 60,
                 height: 60,
                 decoration: const BoxDecoration(
                   shape: BoxShape.circle, // Use circle shape for the container
                   image: DecorationImage(
                     image: AssetImage("assets/face.jpeg"), // Use the image as background
                     fit: BoxFit.cover, // Cover the entire circular area
                   ),
                 ),
               )
             ],
           );
  }
}












class MiniView extends StatefulWidget {
  const MiniView({super.key});

  @override
  State<MiniView> createState() => _MiniViewState();
}

class _MiniViewState extends State<MiniView> {
  int selectedIndex = 0; // Track the selected index

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildSelectableContainer("Most Viewed", 0),
        buildSelectableContainer("Nearby", 1),
        buildSelectableContainer("Latest", 2),
      ],
    );
  }

  // Function to build each selectable container
  Widget buildSelectableContainer(String label, int index) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index; // Update the selected index
        });
      },
      child: Container(
        width: isSelected ? 110 : 105,
        height: 54,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : const Color(0xFFEFEFEF),
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF888888),
          ),
        ),
      ),
    );
  }
}












//
// class MiniView extends StatefulWidget {
//   const MiniView({super.key});
//
//   @override
//   State<MiniView> createState() => _MiniViewState();
// }
//
// class _MiniViewState extends State<MiniView> {
//   String value = "Most Viewed";
//   int i = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         i == 0 ? GestureDetector(
//             onTap: (){
//               setState(() {
//                 i =0;
//               });
//
//             },
//             child: buildContainer("Most Viewed")) :
//         GestureDetector(
//           onTap: (){
//             setState(() {
//               i =0;
//             });
//
//           },
//
//           child: Container(
//             width: 105,
//             height: 54,
//             decoration: BoxDecoration(
//                 color: const Color(0xFFEFEFEF),
//                 borderRadius: BorderRadius.circular(15)
//             ),
//             alignment: Alignment.center,
//
//             child: const Text(
//                 "Most Viewed",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xFF888888),
//                 )
//             ),
//           ),
//         ),
//
//
//         i == 1 ? GestureDetector(
//             onTap: (){
//               setState(() {
//                 i =0;
//               });
//
//             },
//             child: buildContainer("Nearby")) :
//         GestureDetector(
//           onTap: (){
//             setState(() {
//               i =0;
//             });
//
//           },
//           child: Container(
//             width: 105,
//             height: 54,
//             decoration: BoxDecoration(
//               color: const Color(0xFFEFEFEF),
//               borderRadius: BorderRadius.circular(15)
//             ),
//             alignment: Alignment.center,
//
//             child: const Text(
//                 "Nearby",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xFF888888),
//                 )
//             ),
//           ),
//         ),
//         i == 2 ? GestureDetector(
//             onTap: (){
//               setState(() {
//                 i =2;
//               });
//
//             },
//             child: buildContainer("latest")) :
//         GestureDetector(
//           onTap: (){
//             setState(() {
//               i =2;
//             });
//
//           },
//           child: Container(
//             width: 105,
//             height: 54,
//             decoration: BoxDecoration(
//                 color: const Color(0xFFEFEFEF),
//                 borderRadius: BorderRadius.circular(15)
//             ),
//             alignment: Alignment.center,
//
//             child: const Text(
//                 "Latest",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xFF888888),
//                 )
//             ),
//           ),
//         ),
//
//       ],
//     );
//   }
//
//   Container buildContainer(String str) {
//     return Container(
//       width: 136,
//         height: 54,
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(15),
//
//         ),
//         alignment: Alignment.center,
//
//         child: Text(str,
//             style: const  TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               color: Colors.white
//
//             ),
//
//         )
//       );
//   }
// }
