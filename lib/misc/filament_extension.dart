/*
 * Copyright (c) 2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:common/util/extensions/object_extension.dart';
import 'package:flutter/material.dart';
import 'package:mobileraker_pro/spoolman/dto/filament.dart';

extension UiFilament on Filament {
  Color? get color => colorHex?.let((it) => Color(int.tryParse(it, radix: 16) ?? Colors.white24.value));
}
