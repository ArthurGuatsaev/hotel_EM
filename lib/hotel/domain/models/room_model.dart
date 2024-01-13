import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RoomModel {
  final int id;
  final String name;
  final int price;
  final String pricePer;
  final List<String> peculiarities;
  final List<String> images;
  const RoomModel({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.images,
  });

  RoomModel copyWith({
    int? id,
    String? name,
    int? price,
    String? pricePer,
    List<String>? peculiarities,
    List<String>? images,
  }) {
    return RoomModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      pricePer: pricePer ?? this.pricePer,
      peculiarities: peculiarities ?? this.peculiarities,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'pricePer': pricePer,
      'peculiarities': peculiarities,
      'images': images,
    };
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as int,
      pricePer: map['price_per'] as String,
      peculiarities: List<String>.from((map['peculiarities'] as List<dynamic>)),
      images: List<String>.from((map['image_urls'] as List<dynamic>)),
    );
  }

  @override
  bool operator ==(covariant RoomModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.price == price &&
        other.pricePer == pricePer &&
        listEquals(other.peculiarities, peculiarities) &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        pricePer.hashCode ^
        peculiarities.hashCode ^
        images.hashCode;
  }
}
