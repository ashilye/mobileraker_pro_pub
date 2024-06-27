/*
 * Copyright (c) 2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobileraker_pro/spoolman/dto/spoolman_dto_mixin.dart';

enum SpoolmanListType {
  spools,
  filaments,
  vendors;

  String get noDtosFoundStr => switch (this) {
        SpoolmanListType.spools => 'pages.spoolman.no_spools',
        SpoolmanListType.filaments => 'pages.spoolman.no_filaments',
        SpoolmanListType.vendors => 'pages.spoolman.no_vendors',
      };

  String get errorLoadingStr => switch (this) {
        SpoolmanListType.spools => 'pages.spoolman.error_loading_spools',
        SpoolmanListType.filaments => 'pages.spoolman.error_loading_filaments',
        SpoolmanListType.vendors => 'pages.spoolman.error_loading_vendors',
      };
}

class SpoolmanScrollPagination extends ConsumerStatefulWidget {
  const SpoolmanScrollPagination({
    super.key,
    required this.machineUUID,
    required this.type,
    this.scrollController,
    this.physics,
    this.padding,
    this.onEntryTap,
  });

  final SpoolmanListType type;

  final String machineUUID;

  final ScrollController? scrollController;

  final ScrollPhysics? physics;

  final EdgeInsets? padding;

  final Function(SpoolmanDtoMixin)? onEntryTap;

  @override
  ConsumerState<SpoolmanScrollPagination> createState() => SpoolmanInfinitListState();
}

class SpoolmanInfinitListState extends ConsumerState<SpoolmanScrollPagination> {
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    return Placeholder();
  }
}
