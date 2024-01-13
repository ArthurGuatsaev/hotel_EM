import 'package:flutter/cupertino.dart';
import 'navigation_state.dart';
import 'router/delegate.dart';

class MyNavigatorManager {
  MyNavigatorManager._();
  static MyNavigatorManager instance = MyNavigatorManager._();
  final key = GlobalKey<NavigatorState>();
  static final MyRouterDelegate delegate = MyRouterDelegate.instance;
  NavigatorState? get nav => key.currentState;

  void pushRoom() {
    delegate.myNS = MyNavigationState.room();
    delegate.notify();
  }

  void pushHotel() {
    delegate.myNS = MyNavigationState.hotel();
    delegate.notify();
  }

  void pushReserv() {
    delegate.myNS = MyNavigationState.reserv();
    delegate.notify();
  }

  void pushSuccess() {
    delegate.myNS = MyNavigationState.success();
    delegate.notify();
  }
}
