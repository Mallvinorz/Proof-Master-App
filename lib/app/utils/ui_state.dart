import 'package:flutter/foundation.dart';

@immutable
sealed class UIState<T> {
  const UIState();
}

class UIInitial<T> extends UIState<T> {
  const UIInitial();
}

class UILoading<T> extends UIState<T> {
  const UILoading();
}

class UISuccess<T> extends UIState<T> {
  final T data;
  const UISuccess(this.data);
}

class UIError<T> extends UIState<T> {
  final String message;
  const UIError(this.message);
}
