import 'dart:async';
import 'dart:developer';
import 'package:hotel_test_app/hotel/domain/repositories/hotel_repository.dart';

import '../domain/dependencies.dart';

Future<Dependencies> $initializeDependencies(
    {Function(int progress, String message)? onProgress}) async {
  final dependencies = MutableDependencies();
  final totalStaps = _initializationSteps.length;
  var currentStep = 0;
  for (final step in _initializationSteps.entries) {
    currentStep++;
    final percent = (currentStep * 100 ~/ totalStaps).clamp(0, 100);
    onProgress?.call(percent, step.key);
    await step.value(dependencies);
    log('initialization: $currentStep/$totalStaps ($percent) | ${step.key}');
  }
  return dependencies.freeze();
}

typedef _InitializationStep = FutureOr<void> Function(
    MutableDependencies dependencies);
final Map<String, _InitializationStep> _initializationSteps =
    <String, _InitializationStep>{
  'Hotel initialization': (dependencies) async {
    final hotel = HotelRepository();
    await hotel.getHotels();
    await hotel.getRooms();
    await hotel.getReserv();
    dependencies.hotelRepository = hotel;
  },
  'Delegate initialization': (dependencies) async {
    // final delegate = MyRouterDelegate.instance;
  },
};
