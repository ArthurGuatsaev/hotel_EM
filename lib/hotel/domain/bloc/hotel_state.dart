// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hotel_bloc.dart';

class HotelState {
  final HotelModel? hotel;
  final ReservModel? reserv;
  final List<RoomModel> rooms;
  final int touristNumber;
  final HotelClent client;
  final OrderStatus status;
  const HotelState(
      {this.hotel,
      this.rooms = const [],
      this.status = OrderStatus.initial,
      this.reserv,
      this.touristNumber = 2,
      this.client = const HotelClent()});

  HotelState copyWith(
      {HotelModel? hotel,
      List<RoomModel>? rooms,
      OrderStatus? status,
      ReservModel? reserv,
      HotelClent? client,
      int? touristNumber}) {
    return HotelState(
      hotel: hotel ?? this.hotel,
      client: client ?? this.client,
      rooms: rooms ?? this.rooms,
      status: status ?? this.status,
      touristNumber: touristNumber ?? this.touristNumber,
      reserv: reserv ?? this.reserv,
    );
  }
}

enum OrderStatus {
  success,
  errror,
  initial,
}
