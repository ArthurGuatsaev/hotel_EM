import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../hotel/domain/bloc/hotel_bloc.dart';
import '../../navigation/router/information.dart';
import '/initialize/domain/dependencies.dart';
import '../../navigation/nav_manager.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dependencies = context
        .dependOnInheritedWidgetOfExactType<InheritedDependencies>()
        ?.dependencies;
    return MultiBlocProvider(
      providers: [
        BlocProvider<HotelBloc>(
          create: (context) =>
              HotelBloc(hotelRepository: dependencies!.hotelRepository)
                ..add(GetHotelsEvent()),
        ),
      ],
      child: MyAppRouter(dependencies: dependencies),
    );
  }
}

class MyAppRouter extends StatelessWidget {
  const MyAppRouter({
    super.key,
    required this.dependencies,
  });

  final Dependencies? dependencies;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white.withOpacity(0.95)),
      routerDelegate: MyNavigatorManager.delegate,
      routeInformationParser: MyRouterInformationParser(),
    );
  }
}
