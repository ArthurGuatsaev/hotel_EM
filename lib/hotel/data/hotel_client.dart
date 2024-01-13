import 'dart:convert';
import 'dart:developer';

import 'package:hotel_test_app/hotel/domain/models/reserv_model.dart';
import 'package:hotel_test_app/hotel/domain/models/room_model.dart';

import '/hotel/domain/models/hotel_model.dart';
import 'package:http/http.dart' as http;

class HotelApiClient {
  static Future<HotelModel?> getHotels() async {
    try {
      final client = http.Client();
      final url = Uri.parse(
          'https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473');
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final jsonT = jsonDecode(response.body) as Map<String, dynamic>;
        return HotelModel.fromMap(jsonT);
      }
      log('get hotel status code: ${response.statusCode}');
      return null;
    } catch (e) {
      log('get hotel error : $e');
      return null;
    }
  }

  static Future<List<RoomModel>> getRooms() async {
    try {
      final client = http.Client();
      final url = Uri.parse(
          'https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195');
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final jsonT = jsonDecode(response.body) as Map<String, dynamic>;
        final row = jsonT['rooms'] as List<dynamic>;
        return row
            .map((e) => RoomModel.fromMap(e as Map<String, dynamic>))
            .toList();
      }
      log('get rooms status code: ${response.statusCode}');
      return [];
    } catch (e) {
      log('get rooms error : $e');
      return [];
    }
  }

  static Future<ReservModel?> getReserv() async {
    try {
      final client = http.Client();
      final url = Uri.parse(
          'https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff');
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final jsonT = jsonDecode(response.body) as Map<String, dynamic>;
        return ReservModel.fromMap(jsonT);
      }
      log('get rooms status code: ${response.statusCode}');
      return null;
    } catch (e) {
      log('get rooms error : $e');
      return null;
    }
  }
}
