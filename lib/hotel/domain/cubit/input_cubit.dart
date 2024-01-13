import 'package:bloc/bloc.dart';
import 'package:hotel_test_app/hotel/domain/bloc/hotel_bloc.dart';
import 'package:hotel_test_app/hotel/domain/models/tourist_model.dart';

part 'input_state.dart';

class InputCubit extends Cubit<InputState> {
  final HotelBloc hotel;
  final int id;
  InputCubit({required this.hotel, required this.id})
      : super(InputState(id: id));

  addTourist() {
    hotel.add(AddTouristEvent(tourist: state.tourist));
  }

  changeName(String name) {
    emit(state.copyWith(tourist: state.tourist.copyWith(name: name, id: id)));
    addTourist();
  }

  changeLastName(String lastName) {
    emit(state.copyWith(
        tourist: state.tourist.copyWith(lastName: lastName, id: id)));
    addTourist();
  }

  changedateB(String date) {
    emit(
        state.copyWith(tourist: state.tourist.copyWith(dateOfB: date, id: id)));
    addTourist();
  }

  changeFrom(String from) {
    emit(state.copyWith(tourist: state.tourist.copyWith(from: from, id: id)));
    addTourist();
  }

  changePassport(String value) {
    emit(state.copyWith(
        tourist: state.tourist.copyWith(passport: value, id: id)));
    addTourist();
  }

  changePassTime(String value) {
    emit(state.copyWith(
        tourist: state.tourist.copyWith(passportTime: value, id: id)));
    addTourist();
  }
}
