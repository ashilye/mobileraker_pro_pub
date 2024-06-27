/*
 * Copyright (c) 2023-2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// This does not verify if the printe rhas a spoolmanager, this is expected to check by the components that use this component
class SelectSpoolmanSheet extends ConsumerWidget {
  const SelectSpoolmanSheet({super.key, required this.machineUUID});

  final String machineUUID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder();
  }
}
