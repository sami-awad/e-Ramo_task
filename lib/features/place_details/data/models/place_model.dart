class PlaceModel {
  final String title;
  final String description;
  final String category;
  final String location;
  final double rating;
  final int reviewCount;
  final int capacity;
  final bool isOpen;
  final bool isAvailable;
  final double pricePerHour;
  final String imagePath;

  const PlaceModel({
    required this.title,
    required this.description,
    required this.category,
    required this.location,
    required this.rating,
    required this.reviewCount,
    required this.capacity,
    required this.isOpen,
    required this.isAvailable,
    required this.pricePerHour,
    required this.imagePath,
  });
}
