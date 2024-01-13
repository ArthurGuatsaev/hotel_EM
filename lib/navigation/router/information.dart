import 'package:flutter/material.dart';
import '../navigation_state.dart';

class MyRouterInformationParser
    extends RouteInformationParser<MyNavigationState> {
  @override
  Future<MyNavigationState> parseRouteInformation(
      RouteInformation routeInformation) async {
    final location = routeInformation.location;
    // if (location == null) {
    //   return MyNavigationState.home();
    // }
    final url = Uri.parse(location);
    if (url.pathSegments.isEmpty) {
      return MyNavigationState.hotel();
    }
    if (url.pathSegments.length == 2) {
      // final itemId = url.pathSegments[1];
    }
    return MyNavigationState.hotel();
  }

  @override
  RouteInformation? restoreRouteInformation(MyNavigationState configuration) {
    return super.restoreRouteInformation(configuration);
  }
}
