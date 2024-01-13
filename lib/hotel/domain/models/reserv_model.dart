import 'package:hotel_test_app/hotel/domain/models/base_model.dart';

class ReservModel implements BaseModel {
  final int id;
  @override
  final String name;
  final String hotelAdress;
  @override
  final int rating;
  @override
  final String ratingName;
  final String departure;
  final String arrivalCountry;
  final String startDate;
  final String stopDate;
  final int numberOfNights;
  final String room;
  final String nutrition;
  final int tourPrice;
  final int fuelChange;
  final int serviceCharge;
  ReservModel({
    required this.id,
    required this.name,
    required this.hotelAdress,
    required this.rating,
    required this.ratingName,
    required this.departure,
    required this.arrivalCountry,
    required this.startDate,
    required this.stopDate,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelChange,
    required this.serviceCharge,
  });

  ReservModel copyWith({
    int? id,
    String? name,
    String? hotelAdress,
    int? rating,
    String? ratingName,
    String? departure,
    String? arrivalCountry,
    String? startDate,
    String? stopDate,
    int? numberOfNights,
    String? room,
    String? nutrition,
    int? tourPrice,
    int? fuelChange,
    int? serviceCharge,
  }) {
    return ReservModel(
      id: id ?? this.id,
      name: name ?? this.name,
      hotelAdress: hotelAdress ?? this.hotelAdress,
      rating: rating ?? this.rating,
      ratingName: ratingName ?? this.ratingName,
      departure: departure ?? this.departure,
      arrivalCountry: arrivalCountry ?? this.arrivalCountry,
      startDate: startDate ?? this.startDate,
      numberOfNights: numberOfNights ?? this.numberOfNights,
      room: room ?? this.room,
      stopDate: stopDate ?? this.stopDate,
      nutrition: nutrition ?? this.nutrition,
      tourPrice: tourPrice ?? this.tourPrice,
      fuelChange: fuelChange ?? this.fuelChange,
      serviceCharge: serviceCharge ?? this.serviceCharge,
    );
  }

  factory ReservModel.fromMap(Map<String, dynamic> map) {
    return ReservModel(
      id: map['id'] as int,
      name: map['hotel_name'] as String,
      hotelAdress: map['hotel_adress'] as String,
      rating: map['horating'] as int,
      ratingName: map['rating_name'] as String,
      departure: map['departure'] as String,
      arrivalCountry: map['arrival_country'] as String,
      startDate: map['tour_date_start'] as String,
      stopDate: map['tour_date_stop'] as String,
      numberOfNights: map['number_of_nights'] as int,
      room: map['room'] as String,
      nutrition: map['nutrition'] as String,
      tourPrice: map['tour_price'] as int,
      fuelChange: map['fuel_charge'] as int,
      serviceCharge: map['service_charge'] as int,
    );
  }

  @override
  bool operator ==(covariant ReservModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.hotelAdress == hotelAdress &&
        other.rating == rating &&
        other.ratingName == ratingName &&
        other.departure == departure &&
        other.arrivalCountry == arrivalCountry &&
        other.startDate == startDate &&
        other.numberOfNights == numberOfNights &&
        other.room == room &&
        other.nutrition == nutrition &&
        other.tourPrice == tourPrice &&
        other.fuelChange == fuelChange &&
        other.serviceCharge == serviceCharge;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        hotelAdress.hashCode ^
        rating.hashCode ^
        ratingName.hashCode ^
        departure.hashCode ^
        arrivalCountry.hashCode ^
        startDate.hashCode ^
        numberOfNights.hashCode ^
        room.hashCode ^
        nutrition.hashCode ^
        tourPrice.hashCode ^
        fuelChange.hashCode ^
        serviceCharge.hashCode;
  }

  int get allPrice => fuelChange + tourPrice + serviceCharge;
}
