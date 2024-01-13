import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../initialize/domain/dependencies.dart';
import '../initialize/view/home_app.dart';
import '../initialize/view/loading_app.dart';
import '../initialize/domain/repo.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp]);
      final initializationProgress =
          ValueNotifier<({int progress, String message})>(
        (progress: 0, message: ''),
      );
      runApp(
        InitializationSplashScreen(
          progress: initializationProgress,
        ),
      );
      initializeApp(
        onProgress: (progress, message) => initializationProgress.value =
            (message: message, progress: progress),
        onSuccess: (dependencies) {
          runApp(
            InheritedDependencies(
              dependencies: dependencies,
              child: const HomeApp(),
            ),
          );
        },
      );
    },
    (error, stack) {
      print(stack);
    },
  );
}
