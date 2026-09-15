import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    log("Bloc : $change");
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    log("changes: $bloc");
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    log("Bloc : $bloc");
  }

  @override
  void onDone(
    Bloc<dynamic, dynamic> bloc,
    Object? event, [
    Object? error,
    StackTrace? stackTrace,
  ]) {}

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log("Error: $error");
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {}

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    log("Transition: $transition");
  }
}
