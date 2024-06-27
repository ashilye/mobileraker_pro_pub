/*
 * Copyright (c) 2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobileraker_pro/spoolman/dto/spoolman_dto_mixin.dart';

import 'spoolman_scroll_pagination.dart';

class SpoolmanStaticPagination extends ConsumerStatefulWidget {
  const SpoolmanStaticPagination({
    super.key,
    required this.machineUUID,
    required this.type,
    this.onEntryTap,
    this.initialCount = 5,
    this.filters,
    this.exclude,
  });

  final Map<String, dynamic>? filters;

  final int initialCount;

  final SpoolmanListType type;

  final String machineUUID;

  final Function(SpoolmanDtoMixin)? onEntryTap;

  final SpoolmanDtoMixin? exclude;

  @override
  ConsumerState<SpoolmanStaticPagination> createState() => SpoolmanInfinitListState();
}

class SpoolmanInfinitListState extends ConsumerState<SpoolmanStaticPagination> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
