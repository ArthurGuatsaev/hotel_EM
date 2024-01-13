import 'package:flutter/material.dart';

class MyNavigationState extends ChangeNotifier {
  MyNavigationState.hotel();
  MyNavigationState.room({this.room = true});
  MyNavigationState.reserv({this.room = true, this.reserv = true});
  MyNavigationState.success(
      {this.room = true, this.reserv = true, this.success = true});
  bool room = false;
  bool hotel = true;
  bool reserv = false;
  bool success = false;
}
