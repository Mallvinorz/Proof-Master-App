import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'routes.freezed.dart';

@freezed
class Routes with _$Routes {
  factory Routes({required String route, required Widget child}) = _Routes;
}
