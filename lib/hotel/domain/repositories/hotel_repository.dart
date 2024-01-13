import 'package:hotel_test_app/hotel/domain/models/reserv_model.dart';
import 'package:hotel_test_app/hotel/domain/models/room_model.dart';

import '../../data/hotel_client.dart';
import '../models/hotel_model.dart';

class HotelRepository {
  HotelModel? hotels;
  List<RoomModel>? rooms;
  ReservModel? reserv;
  Future<HotelModel?> getHotels() async {
    hotels = await HotelApiClient.getHotels();
    return hotels;
  }

  Future<ReservModel?> getReserv() async {
    reserv = await HotelApiClient.getReserv();
    return reserv;
  }

  Future<List<RoomModel>> getRooms() async {
    rooms = await HotelApiClient.getRooms();
    return rooms ?? <RoomModel>[];
  }
}
