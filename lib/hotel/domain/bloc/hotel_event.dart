part of 'hotel_bloc.dart';

abstract class HotelEvent {}

class GetHotelsEvent extends HotelEvent {}

class AddTouristNumberEvent extends HotelEvent {}

class SendOrderEvent extends HotelEvent {}

class AddPhoneEvent extends HotelEvent {
  final String phone;

  AddPhoneEvent({required this.phone});
}

class AddEmailEvent extends HotelEvent {
  final String email;

  AddEmailEvent({required this.email});
}

class ChangeStatusEvnet extends HotelEvent {}

class AddTouristEvent extends HotelEvent {
  final TouristModel tourist;

  AddTouristEvent({required this.tourist});
}
