class Schools {
  String imagePath;
  String schoolName;
  String schoolDescription;
  String schoolWebsite;
  String? toContact;

  Schools({
    required this.imagePath,
    required this.schoolName,
    required this.schoolDescription,
    required this.schoolWebsite,
    this.toContact,
  });
}

List<Schools> schools = [
  Schools(
    imagePath: "assets/Schools/UM6P_1337.png",
    schoolName: "1337",
    schoolDescription: "1337 offers the first computer training program in Morocco, entirely free",
    schoolWebsite: "https://1337.ma",
  ),
  Schools(
    imagePath: "assets/Schools/EMINES.png",
    schoolName: "EMINES",
    schoolDescription: "The School of Industrial Management trains industrial managers able to respond to complex global challenges.",
    schoolWebsite: "https://emines.um6p.ma",
  ),
  Schools(
    imagePath: "assets/Schools/SAP+D.png",
    schoolName: "SAP+D",
    schoolDescription: "The School of Architecture, Planning & Design (SAP+D) is a school of innovation in architecture.",
    schoolWebsite: "https://sapd.um6p.ma",
  ),
  Schools(
    imagePath: "assets/Schools/CC.jpg",
    schoolName: "College of Computing",
    schoolDescription: "College of Computing establishes itself as a leading institution in Computer Science education and research.",
    schoolWebsite: "https://cc.um6p.ma",
  ),
];
