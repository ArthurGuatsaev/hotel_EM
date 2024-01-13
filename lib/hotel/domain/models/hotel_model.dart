import 'package:flutter/foundation.dart';
import 'package:hotel_test_app/hotel/domain/models/base_model.dart';

class HotelModel implements BaseModel {
  final int id;
  final List<String> images;
  @override
  final String name;
  final String adress;
  final int price;
  final int rating;
  final String ratingName;
  final String priceForIt;
  final List<String> tags;
  final String description;
  HotelModel({
    this.id = 0,
    this.ratingName = '',
    this.images = const [],
    this.name = '',
    this.adress = '',
    this.priceForIt = '',
    this.price = 0,
    this.rating = 0,
    this.tags = const [],
    this.description = '',
  });

  HotelModel copyWith({
    int? id,
    List<String>? images,
    String? name,
    String? adress,
    int? price,
    int? rating,
    List<String>? tags,
    String? description,
    String? ratingName,
    String? priceForIt,
  }) {
    return HotelModel(
      id: id ?? this.id,
      images: images ?? this.images,
      ratingName: ratingName ?? this.ratingName,
      priceForIt: priceForIt ?? this.priceForIt,
      name: name ?? this.name,
      adress: adress ?? this.adress,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      tags: tags ?? this.tags,
      description: description ?? this.description,
    );
  }

  factory HotelModel.fromMap(Map<String, dynamic> map) {
    return HotelModel(
      id: map['id'] as int,
      images: List<String>.from((map['image_urls'] as List<dynamic>)),
      name: map['name'] as String,
      adress: map['adress'] as String,
      price: map['minimal_price'] as int,
      rating: map['rating'] as int,
      ratingName: map['rating_name'] as String,
      tags: List<String>.from(
          (map['about_the_hotel']['peculiarities'] as List<dynamic>)),
      priceForIt: map['price_for_it'],
      description: map['about_the_hotel']['description'] as String,
    );
  }

  @override
  String toString() {
    return 'HotelModel(images: $images, name: $name, adress: $adress, price: $price, rating: $rating, tags: $tags, description: $description)';
  }

  @override
  bool operator ==(covariant HotelModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.images, images) &&
        other.name == name &&
        other.adress == adress &&
        other.price == price &&
        other.rating == rating &&
        other.description == description;
  }

  @override
  int get hashCode {
    return images.hashCode ^
        name.hashCode ^
        adress.hashCode ^
        price.hashCode ^
        rating.hashCode ^
        tags.hashCode ^
        description.hashCode;
  }
}
