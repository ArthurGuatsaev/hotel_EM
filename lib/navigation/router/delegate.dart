import 'package:flutter/material.dart';
import 'package:hotel_test_app/hotel/view/order_view.dart';
import 'package:hotel_test_app/hotel/view/room_view.dart';
import 'package:hotel_test_app/hotel/view/success.dart';
import '/hotel/view/hotel_view.dart';
import '../nav_manager.dart';
import '../navigation_state.dart';

class MyRouterDelegate extends RouterDelegate<MyNavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyNavigationState> {
  static MyRouterDelegate instance = MyRouterDelegate._();
  MyNavigationState? myNS;
  @override
  final GlobalKey<NavigatorState> navigatorKey =
      MyNavigatorManager.instance.key;
  MyRouterDelegate._();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(child: HotelView()),
        if (myNS?.room == true)
          const MaterialPage(child: RoomView(), name: 'room'),
        if (myNS?.reserv == true)
          const MaterialPage(child: ReservView(), name: 'reserv'),
        if (myNS?.success == true)
          const MaterialPage(child: SuccessPage(), name: 'success'),
      ],
      onPopPage: onPop,
    );
  }

  @override
  Future<void> setNewRoutePath(MyNavigationState configuration) async {
    // myNS = configuration;
    // notifyListeners();
  }

  bool onPop(Route<dynamic> route, dynamic result) {
    switch (route.settings.name) {
      case 'room':
        myNS = MyNavigationState.hotel();
        notifyListeners();
      case 'reserv':
        myNS = MyNavigationState.room();
        notifyListeners();
      case 'success':
        myNS = MyNavigationState.reserv();
        notifyListeners();
    }
    return false;
  }

  void notify() => notifyListeners();
}
