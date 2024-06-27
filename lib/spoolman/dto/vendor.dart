/*
 * Copyright (c) 2023-2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:common/data/converters/integer_converter.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'spoolman_dto_mixin.dart';

part 'vendor.freezed.dart';
part 'vendor.g.dart';

@freezed
class Vendor with _$Vendor, SpoolmanDtoMixin {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Vendor({
    @IntegerConverter() required int id,
    required DateTime registered,
    required String name,
    String? comment,
  }) = _Vendor;

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
}
