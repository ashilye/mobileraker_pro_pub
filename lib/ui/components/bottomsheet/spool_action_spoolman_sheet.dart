/*
 * Copyright (c) 2023-2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../spoolman/dto/spool.dart';

/// This does not verify if the printe rhas a spoolmanager, this is expected to check by the components that use this component
class SpoolActionSpoolmanSheet extends ConsumerWidget {
  const SpoolActionSpoolmanSheet({super.key, required this.machineUUID, required this.spool});

  final String machineUUID;
  final Spool spool;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder();
  }
}
