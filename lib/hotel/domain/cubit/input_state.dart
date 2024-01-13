// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'input_cubit.dart';

class InputState {
  final TouristModel tourist;
  final int id;
  const InputState({
    required this.id,
    this.tourist = const TouristModel(),
  });

  InputState copyWith({
    TouristModel? tourist,
    int? id,
  }) {
    return InputState(
      id: id ?? this.id,
      tourist: tourist ?? this.tourist,
    );
  }
}
