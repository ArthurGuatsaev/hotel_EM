abstract interface class BaseModel {
  final String name;
  final int rating;
  final String ratingName;
  const BaseModel({
    required this.name,
    required this.rating,
    required this.ratingName,
  });
}
