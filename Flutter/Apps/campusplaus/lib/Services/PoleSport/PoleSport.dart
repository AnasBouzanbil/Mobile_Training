import 'package:campusplaus/Data/Services/PoleSportData.dart';
import 'package:flutter/material.dart';

class Polesport extends StatelessWidget {
  const Polesport({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25, top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning 🔥',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff192126),
                      fontFamily: 'Lato-SemiBold',
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Pramuditya Uzumaki',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff192126),
                      fontFamily: 'Lato-ExtraBold',
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200, // Limit the height for the horizontal list
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: 280,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Background image with cover fit
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          sports[index].sportImage,
                          width: 280,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Dark overlay
                      Container(
                        width: 280,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4), // Adjust opacity as needed
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      // Text content
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              sports[index].sportName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              sports[index].description,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[300],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
