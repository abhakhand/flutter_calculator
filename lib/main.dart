import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/app/app.dart';
import 'package:flutter_calculator/app/observers/app_bloc_observer.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      FlutterError.onError = (details) {
        log(details.exceptionAsString(), stackTrace: details.stack);
      };

      await BlocOverrides.runZoned(
        () async => runApp(const App()),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
