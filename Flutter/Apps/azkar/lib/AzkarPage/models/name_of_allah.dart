class NameOfAllah {
  final int id;
  final String name;
  final String text;

  NameOfAllah({
    required this.id,
    required this.name,
    required this.text,
  });

  factory NameOfAllah.fromJson(Map<String, dynamic> json) {
    return NameOfAllah(
      id: json['id'],
      name: json['name'],
      text: json['text'],
    );
  }
}
