import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SafeCubit<S> extends Cubit<S> {
  SafeCubit(super.initialState);

  String get logTag => runtimeType.toString();

  void safeEmit(S next) {
    if (isClosed) return;
    emit(next);
  }

  void log(String message, {Object? error}) {
    developer.log(message, name: logTag, error: error);
  }
}