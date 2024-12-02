class ListElement {
  String city;
  String country;
  String mountainName;
  String description;
  String price;
  String imagePath;

  // Constructor with named parameters
  ListElement({
    required this.city,
    required this.country,
    required this.mountainName,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}

// List of elements with fixed syntax and additional elements
List<ListElement> elements = [
  ListElement(
    city: "Tokyo",
    country: "Japan",
    mountainName: "Duo",
    description: "This vast mountain range is renowned for its remarkable diversity in terms of topography and climate. It features towering peaks, active volcanoes, d This vast mountain range is renowned for its remarkable diversity in terms of topography and climate. It features towering peaks, active volcanoes, deep canyons, expansive plateaus, and lush valleys.",
    price: "\$230",
    imagePath: "assets/image.png",
  ),
  ListElement(
    city: "Kathmandu",
    country: "Nepal",
    mountainName: "Everest",
    description: "Known as the world's tallest peak, Mount Everest offers a challenging yet rewarding experience for mountain climbers and nature lovers.",
    price: "\$550",
    imagePath: "assets/image.png",
  ),
  ListElement(
    city: "Zurich",
    country: "Switzerland",
    mountainName: "Swiss Alps",
    description: "The Swiss Alps provide breathtaking views and incredible skiing resorts, attracting tourists from around the world.",
    price: "\$400",
    imagePath: "assets/image.png",
  ),
  ListElement(
    city: "Banff",
    country: "Canada",
    mountainName: "Rocky Mountains",
    description: "The Rocky Mountains are famous for their rugged landscapes, diverse wildlife, and excellent hiking trails.",
    price: "\$300",
    imagePath: "assets/image.png",
  ),
];
