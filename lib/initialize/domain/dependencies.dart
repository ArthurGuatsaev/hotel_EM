import 'package:flutter/widgets.dart';
import '/hotel/domain/repositories/hotel_repository.dart';

abstract interface class Dependencies {
  abstract final HotelRepository hotelRepository;
}

class MutableDependencies implements Dependencies {
  final Map<String, Object> context = {};
  @override
  late HotelRepository hotelRepository;

  Dependencies freeze() =>
      UnmutableDependencies(hotelRepository: hotelRepository);
}

final class UnmutableDependencies implements Dependencies {
  @override
  final HotelRepository hotelRepository;
  UnmutableDependencies({required this.hotelRepository});
}

class InheritedDependencies extends InheritedWidget {
  final Dependencies dependencies;
  const InheritedDependencies({
    required super.child,
    super.key,
    required this.dependencies,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
