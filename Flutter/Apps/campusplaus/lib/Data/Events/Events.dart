class Services {
  String image;
  String title;
  String date;
  String description;

  Services({
    required this.image,
    required this.title,
    required this.date,
    required this.description,
  });
}

List<Services> events = [
  Services(
    image: "assets/um6p.webp",
    title: "Concours d'accès aux SAP+D",
    date: "1 week ago",
    description: "Concours pour l'accès de l'école SAP+D pour l'année 2024/2026.",
  ),

  Services(
    image: "assets/um6p.webp",
    title: "Integration for new students",
    date: "1 month ago",
    description: "Welcoming new students at the UM,6P.",
  ),

  // Add more events here
  Services(
    image: "assets/um6p.webp",
    title: "Student Counseling Session",
    date: "2 days ago",
    description: "A session providing counseling for students' academic challenges.",
  ),

  Services(
    image: "assets/um6p.webp",
    title: "Career Development Workshop",
    date: "3 weeks ago",
    description: "A workshop designed to help students develop career skills.",
  ),

  Services(
    image: "assets/um6p.webp",
    title: "Annual Sports Day",
    date: "5 months ago",
    description: "The university's annual sports event to promote fitness and well-being.",
  ),
];
