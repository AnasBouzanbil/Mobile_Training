import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  final String _text =
      "Hello! I'm a passionate developer with expertise in multiple programming languages and frameworks. I enjoy creating robust and efficient applications.";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = StepTween(
      begin: 0,
      end: _text.length,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final Shader headerGradient = LinearGradient(
    colors: [Colors.blue, const Color.fromARGB(255, 37, 94, 0)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: PopupMenuButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/projects'),
                child: const Text('Projects'),
              ),
            ),
            PopupMenuItem(
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/home'),
                child: const Text('Home'),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/me.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SlidingSheet(
            elevation: 8,
            cornerRadius: 16,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.4, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            body: Container(), // Leave body empty for smooth sliding
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _aboutMeSection(),
                      const SizedBox(height: 16),
                      _academicCareerSection(),
                      const SizedBox(height: 16),
                      _myHobbiesSection(),
                      const SizedBox(height: 16),
                      _skillsSection(),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _aboutMeSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Me",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              foreground: Paint()..shader = headerGradient,
            ),
          ),
          const SizedBox(height: 8),
          _animatedText(_text),
        ],
      ),
    );
  }

  Widget _academicCareerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Academic Career",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = headerGradient,
          ),
        ),
        const SizedBox(height: 10),
        _academicEntry("Cadi Ayyad University", "2020 - 2022", "Bachelor's Degree"),
        const SizedBox(height: 10),
        _academicEntry("1337 School", "2022 - Present", "Coding Bootcamp"),
      ],
    );
  }

  Widget _academicEntry(String institution, String period, String details) {
    return ListTile(
      title: Text(
        institution,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        details,
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
      trailing: Text(
        period,
        style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
      ),
    );
  }

  Widget _myHobbiesSection() {
    final List<Map<String, dynamic>> hobbies = [
      {'icon': FontAwesomeIcons.gamepad, 'name': "Gaming"},
      {'icon': FontAwesomeIcons.music, 'name': "Music"},
      {'icon': FontAwesomeIcons.book, 'name': "Reading"},
      {'icon': FontAwesomeIcons.bed, 'name': "Sleeping"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Hobbies",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = headerGradient,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: hobbies
              .map((hobby) => Chip(
                    avatar: Icon(hobby['icon'], color: Colors.blue),
                    label: Text(hobby['name']),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _skillsSection() {
    final List<String> softSkills = ["Communication", "Teamwork", "Problem-solving"];
    final List<String> hardSkills = ["Flutter", "Dart", "JavaScript", "SQL"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Skills",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = headerGradient,
          ),
        ),
        const SizedBox(height: 10),
        _skillsCategory("Soft Skills", softSkills),
        const SizedBox(height: 10),
        _skillsCategory("Hard Skills", hardSkills),
      ],
    );
  }

  Widget _skillsCategory(String title, List<String> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: skills
              .map((skill) => Chip(
                    label: Text(skill),
                    backgroundColor: Colors.blue.shade100,
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _animatedText(String text) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Text(
          text.substring(0, _animation.value),
          style: const TextStyle(
            fontSize: 18,
            height: 1.5,
            color: Colors.black87,
          ),
        );
      },
    );
  }
}
