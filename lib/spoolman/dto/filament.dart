/*
 * Copyright (c) 2023-2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:common/data/converters/integer_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'spoolman_dto_mixin.dart';
import 'vendor.dart';

part 'filament.freezed.dart';
part 'filament.g.dart';

@freezed
class Filament with _$Filament, SpoolmanDtoMixin {
  const Filament._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Filament({
    @IntegerConverter() required int id,
    required DateTime registered,
    String? name,
    Vendor? vendor,
    String? material,
    double? price,
    required double density,
    required double diameter,
    double? weight,
    double? spoolWeight,
    String? articleNumber,
    String? comment,
    @IntegerConverter() int? settingsExtruderTemp,
    @IntegerConverter() int? settingsBedTemp,
    String? colorHex,
    @IntegerConverter() @Default(20) int colorSimilarityThreshold,
  }) = _Filament;

  factory Filament.fromJson(Map<String, dynamic> json) => _$FilamentFromJson(json);
}
