import 'package:bloc/bloc.dart';
import 'package:hotel_test_app/hotel/domain/models/hotel_model.dart';
import 'package:hotel_test_app/hotel/domain/models/reserv_model.dart';
import 'package:hotel_test_app/hotel/domain/models/room_model.dart';
import 'package:hotel_test_app/hotel/domain/models/tourist_model.dart';
import 'package:hotel_test_app/hotel/domain/repositories/hotel_repository.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final HotelRepository hotelRepository;
  HotelBloc({required this.hotelRepository}) : super(const HotelState()) {
    on<GetHotelsEvent>(getHotel);
    on<AddTouristNumberEvent>(addTouristNumber);
    on<AddTouristEvent>(addTourist);
    on<SendOrderEvent>(sendOrder);
    on<ChangeStatusEvnet>(changeStatus);
    on<AddPhoneEvent>(addPhone);
    on<AddEmailEvent>(addEmail);
  }

  getHotel(GetHotelsEvent event, Emitter<HotelState> emit) {
    final hotel = hotelRepository.hotels;
    final rooms = hotelRepository.rooms;
    final reserv = hotelRepository.reserv;
    emit(state.copyWith(hotel: hotel, rooms: rooms, reserv: reserv));
  }

  addTouristNumber(AddTouristNumberEvent event, Emitter<HotelState> emit) {
    if (state.touristNumber > 7) return;
    emit(state.copyWith(touristNumber: state.touristNumber + 1));
  }

  addTourist(AddTouristEvent event, Emitter<HotelState> emit) {
    if (state.client.tourists
        .where((element) => element.id == event.tourist.id)
        .toList()
        .isNotEmpty) {
      final tourists = [...state.client.tourists];
      final newTourists = tourists
          .map((e) => e.id == event.tourist.id ? event.tourist : e)
          .toList();
      return emit(
          state.copyWith(client: state.client.copyWith(tourists: newTourists)));
    }
    final tourists = [...state.client.tourists, event.tourist];
    emit(state.copyWith(client: state.client.copyWith(tourists: tourists)));
  }

  sendOrder(SendOrderEvent event, Emitter<HotelState> emit) {
    if (!state.client.isValid) {
      return emit(state.copyWith(status: OrderStatus.errror));
    }
    emit(state.copyWith(status: OrderStatus.success));
  }

  changeStatus(ChangeStatusEvnet event, Emitter<HotelState> emit) {
    emit(state.copyWith(status: OrderStatus.initial));
  }

  addPhone(AddPhoneEvent event, Emitter<HotelState> emit) {
    emit(state.copyWith(client: state.client.copyWith(phone: event.phone)));
  }

  addEmail(AddEmailEvent event, Emitter<HotelState> emit) {
    emit(state.copyWith(client: state.client.copyWith(email: event.email)));
  }
}
