class Trip {
  final String name;
  final String creator;
  final String mainLocation;
  List<String> placesOfInterest;
  List<String> expenses;
  final DateTime from;
  final DateTime to;

  Trip({
    required this.name,
    required this.creator,
    required this.mainLocation,
    this.placesOfInterest = const [],
    this.expenses = const [],
    required this.from,
    required this.to,
  });
}
