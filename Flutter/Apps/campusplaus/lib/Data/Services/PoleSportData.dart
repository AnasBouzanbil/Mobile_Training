class PoolSport {
  String sportName;
  String sportImage;
  String description;

  PoolSport({required this.sportName, required this.sportImage, required this.description});
}

List<PoolSport> sports = [
  PoolSport(
      sportName: "Bodybuilding Gym-1",
      sportImage: "assets/bodybuilding.jpeg",
      description: "Bodybuilding with cardio in a space that provides high quality."
  ),
  PoolSport(
      sportName: "Bodybuilding Gym-2",
      sportImage: "assets/bodybuilding.jpeg",
      description: "Bodybuilding with cardio in a space that provides high quality."
  ),
  PoolSport(
      sportName: "BasketBall F-1",
      sportImage: "assets/basketball.jpeg",
      description: "A high-quality terrain where students can play and enjoy their time."
  ),
  PoolSport(
      sportName: "BasketBall F-2",
      sportImage: "assets/basketball.jpeg",
      description: "A high-quality terrain where students can play and enjoy their time."
  ),
  PoolSport(
      sportName: "BasketBall F-4",
      sportImage: "assets/basketball.jpeg",
      description: "A high-quality terrain where students can play and enjoy their time."
  ),
  PoolSport(
      sportName: "Swimming",
      sportImage: "assets/swimming.jpeg",
      description: "A high-quality Olympic-sized terrain with coaches where students can swim."
  ),
  PoolSport(
      sportName: "Swimming class",
      sportImage: "assets/swimming.jpeg",
      description: "A high-quality Olympic-sized terrain with coaches where students can swim."
  ),
  PoolSport(
      sportName: "Spinning",
      sportImage: "assets/spinning.jpeg",
      description: "Cardio training using bicycles."
  ),
];
