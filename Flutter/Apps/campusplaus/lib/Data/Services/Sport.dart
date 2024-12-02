class Services {
  String serviceName;
  String description;
  String imagePath;
  String iconPath;

  Services({
    required this.serviceName,
    required this.description,
    required this.imagePath,
    required this.iconPath

  });
}

List<Services> services = [
  Services(
    serviceName: "Sports Department",
    description: "Located in the heart of the university campus, the Sports Center has excellent sports facilities and offers carefully designed physical activities.",
    imagePath: "assets/poleSportCover.png",
    iconPath: "assets/PoleSport.png"
  ),
  Services(
    serviceName: "SOLE",
    description: "S.O.L.E is the UM6P Student Affairs department that envisions to improve student life and promote pride in belonging to UM6P.",
    imagePath: "assets/SOLE.jpeg",
    iconPath: "assets/SOLEIcon.png"
  ),
  Services(
    serviceName: "STARTGate",
    description: "African Startup Campus powered by UM6P.",
    imagePath: "assets/sTARTGATE.png",
    iconPath: "assets/StargtGateBg.jpeg"
  ),
];
