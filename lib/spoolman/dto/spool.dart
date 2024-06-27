/*
 * Copyright (c) 2023-2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:common/data/converters/integer_converter.dart';
import 'package:common/util/extensions/object_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'filament.dart';
import 'spoolman_dto_mixin.dart';

part 'spool.freezed.dart';
part 'spool.g.dart';

@freezed
class Spool with _$Spool, SpoolmanDtoMixin {
  const Spool._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Spool({
    @IntegerConverter() required int id,
    required DateTime registered,
    DateTime? firstUsed,
    DateTime? lastUsed,
    required Filament filament,
    double? remainingWeight,
    required double usedWeight,
    double? remainingLength,
    required double usedLength,
    String? location,
    String? lotNr,
    String? comment,
    required bool archived,
  }) = _Spool;

  factory Spool.fromJson(Map<String, dynamic> json) => _$SpoolFromJson(json);

  double? get progress => filament.weight?.let((it) => 1 - usedWeight / it);
}
