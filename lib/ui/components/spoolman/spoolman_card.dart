/*
 * Copyright (c) 2023-2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:common/service/setting_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpoolmanCard extends HookConsumerWidget {
  const SpoolmanCard({super.key, required this.machineUUID});

  static Widget preview() {
    return const _Preview();
  }

  final String machineUUID;

  CompositeKey get _hadSpoolmanKey => CompositeKey.keyWithString(UiKeys.hadSpoolman, machineUUID);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive();

    return const Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Spoolman Card'),
          Placeholder(
            fallbackHeight: 200,
          ),
        ],
      ),
    );
  }
}

class _Preview extends HookWidget {
  static const String _machineUUID = 'preview';

  const _Preview({super.key});

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    return const SpoolmanCard(machineUUID: _machineUUID);
  }
}
