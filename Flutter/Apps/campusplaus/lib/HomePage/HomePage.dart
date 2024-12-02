import 'dart:ui';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:campusplaus/Data/Events/Events.dart';
import 'package:campusplaus/Data/Schools/Schools.dart';
import 'package:campusplaus/Data/Services/Sport.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:iconly/iconly.dart';

class Homepage extends StatefulWidget {

   const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Key? _currentIndex ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Welcoming(),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Events',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 18,
                  color: Color(0xff192126),
                  fontFamily: 'Lato-Bold',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
            EventsList(),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Services',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 18,
                  color: Color(0xff192126),
                  fontFamily: 'Lato-Bold',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ServicesList(),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Schools',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 18,
                  color: Color(0xff192126),
                  fontFamily: 'Lato-Bold',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15),
            SchoolsList(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: CurvedNavigationBar(
          key: _currentIndex,
          index: 0,
          items: <Widget>[
            const Icon(Icons.home, size: 30),
            const Icon(Icons.receipt_rounded, size: 30),
            const Icon(Icons.call_split, size: 30),
            const Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.lightGreen,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
            });
          },
          letIndexChange: (index) => true,
        ),
      ),


    );
  }

  SingleChildScrollView SchoolsList() {
    return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(schools.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Container(
                    width: 280,
                    height: 174,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(1, 1),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 220,
                          height: 80,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Image.asset(schools[index].imagePath, fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            schools[index].schoolDescription.length > 80
                                ? '${schools[index].schoolDescription.substring(0, 80)}...'
                                : schools[index].schoolDescription,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
  }

  SingleChildScrollView ServicesList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(services.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Container(
              width: 280,
              height: 174,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(services[index].imagePath),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(services[index].imagePath, fit: BoxFit.fill),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: Container(color: Colors.black.withOpacity(0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: AssetImage(services[index].iconPath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            services[index].serviceName,
                            style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15,
                              color: Color(0xff192126),
                              fontFamily: 'Lato-ExtraBold',
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  SingleChildScrollView EventsList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(events.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Container(
              width: 280,
              height: 174,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/um6p.webp"),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset("assets/um6p.webp", fit: BoxFit.fill),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: Container(color: Colors.black.withOpacity(0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Text(
                            events[index].title,
                            style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              color: Color(0xffffffff),
                              fontFamily: 'Lato-Bold',
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xccffffff),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, top: 4, right: 6, bottom: 4),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.timer, color: Color(0xff192126), size: 15),
                                      const SizedBox(width: 4),
                                      Text(
                                        events[index].date,
                                        style: const TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 12,
                                          color: Color(0xff192126),
                                          fontFamily: 'Lato-Regular',
                                          fontWeight: FontWeight.normal,
                                        ),
                                        maxLines: 9999,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFBBF246),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: const Icon(Icons.save),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Padding Welcoming() {
    return Padding(
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
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  color: Color(0xff192126),
                  fontFamily: 'Lato-SemiBold',
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 9999,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Pramuditya Uzumaki',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 24,
                  color: Color(0xff192126),
                  fontFamily: 'Lato-ExtraBold',
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 9999,
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
    );
  }
}
