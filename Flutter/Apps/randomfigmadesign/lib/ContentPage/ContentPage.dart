import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:randomfigmadesign/List/List.dart';

class ContentPage extends StatelessWidget {
  final int index;

  ContentPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _ImageSection(index: index),
          const SizedBox(height: 5),
          _TabRow(width: width),
          const _IconRow(),
          _DescriptionBox(description: elements[index].description),
          const _BookNowButton(),
        ],
      ),
    );
  }
}

class _ImageSection extends StatelessWidget {
  final int index;

  const _ImageSection({required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 25),
      child: Container(
        width: 374,
        height: 460,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(elements[index].imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            const _TopIconsRow(),
            const Spacer(),
            _BottomInfoBox(index: index),
          ],
        ),
      ),
    );
  }
}

class _TabRow extends StatelessWidget {
  final double width;

  const _TabRow({required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 25),
      child: Row(
        children: [
          const Text(
            "Overview",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          SizedBox(width: width / 8 - 12),
          const Text(
            "Details",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _IconRow extends StatelessWidget {
  const _IconRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(3, (index) => const _IconWithLabel())
            .expand((widget) => [widget, const SizedBox(width: 25)])
            .toList(),
      ),
    );
  }
}

class _IconWithLabel extends StatelessWidget {
  const _IconWithLabel();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.access_time, color: Colors.black),
        ),
        const SizedBox(width: 4),
        const Text("8 hours"),
      ],
    );
  }
}

class _DescriptionBox extends StatelessWidget {
  final String description;

  const _DescriptionBox({required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        width: double.infinity,
        height: 150,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.white),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                letterSpacing: 0.5,
                color: Colors.grey,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TopIconsRow extends StatelessWidget {
  const _TopIconsRow();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _CircleIcon(icon: Icons.arrow_back_ios_new_rounded),
          _CircleIcon(icon: Icons.favorite_border),
        ],
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  final IconData icon;

  const _CircleIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.grey.shade500,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}

class _BottomInfoBox extends StatelessWidget {
  final int index;

  const _BottomInfoBox({required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 25),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.60),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${elements[index].mountainName}, ',
                    style: const TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'RobotoRoman-Medium'),
                  ),
                  Text(
                    elements[index].country,
                    style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 16, color: Colors.white),
                  SizedBox(width: 20),
                  Text(
                    'Tokyo, Japan',
                    style: TextStyle(fontSize: 14, color: Color(0xffc9c8c8), fontFamily: 'RobotoRoman-Regular'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BookNowButton extends StatelessWidget {
  const _BookNowButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 373,
      height: 66,
      decoration: BoxDecoration(
        color: const Color(0xff1a1a1a),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, -60),
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Book Now",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 12),
            SvgPicture.asset("assets/send.svg"),
          ],
        ),
      ),
    );
  }
}
