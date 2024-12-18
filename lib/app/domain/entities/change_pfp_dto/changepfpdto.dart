import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'changepfpdto.freezed.dart';

@freezed
class ChangePfpDto with _$ChangePfpDto {
  factory ChangePfpDto({
    required File imageFile,
  }) = _ChangePfpDto;
}
