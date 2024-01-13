// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hotel_test_app/hotel/domain/repositories/input_validator.dart';

class HotelClent {
  final String email;
  final String phone;
  final List<TouristModel> tourists;
  const HotelClent({
    this.email = '',
    this.phone = '',
    this.tourists = const [],
  });

  HotelClent copyWith({
    String? email,
    String? phone,
    List<TouristModel>? tourists,
  }) {
    return HotelClent(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      tourists: tourists ?? this.tourists,
    );
  }

  bool get isValid {
    if (Validator.emailValidatorString(email) != null) return false;
    if (Validator.phoneValidatorString(phone) != null) return false;
    if (tourists.isEmpty) return false;
    if (tourists.where((element) => !element.isValid).toList().isNotEmpty) {
      return false;
    }
    return true;
  }
}

class TouristModel {
  final int id;
  final String name;
  final String lastName;
  final String dateOfB;
  final String from;
  final String passport;
  final String passportTime;
  const TouristModel({
    this.id = 0,
    this.name = '',
    this.lastName = '',
    this.dateOfB = '',
    this.from = '',
    this.passport = '',
    this.passportTime = '',
  });

  TouristModel copyWith({
    int? id,
    String? name,
    String? lastName,
    String? dateOfB,
    String? from,
    String? passport,
    String? passportTime,
  }) {
    return TouristModel(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      dateOfB: dateOfB ?? this.dateOfB,
      from: from ?? this.from,
      passport: passport ?? this.passport,
      passportTime: passportTime ?? this.passportTime,
    );
  }

  bool get isValid {
    if (Validator.nameValidatorString(name) != null) return false;
    if (Validator.nameValidatorString(lastName) != null) return false;
    if (Validator.nameValidatorString(dateOfB) != null) return false;
    if (Validator.nameValidatorString(from) != null) return false;
    if (Validator.nameValidatorString(passport) != null) return false;
    if (Validator.nameValidatorString(passportTime) != null) return false;
    return true;
  }
}
