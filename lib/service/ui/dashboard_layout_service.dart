/*
 * Copyright (c) 2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:common/data/model/hive/dashboard_component.dart';
import 'package:common/data/model/hive/dashboard_component_type.dart';
import 'package:common/data/model/hive/dashboard_layout.dart';
import 'package:common/data/model/hive/dashboard_tab.dart';
import 'package:common/data/model/hive/machine.dart';
import 'package:common/util/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_layout_service.g.dart';

@riverpod
Future<DashboardLayout> dashboardLayout(DashboardLayoutRef ref, String machineUUID) async {
  return ref.watch(dashboardLayoutServiceProvider).defaultDashboardLayout();
}

@riverpod
DashboardLayoutService dashboardLayoutService(DashboardLayoutServiceRef ref) {
  ref.keepAlive();
  return DashboardLayoutService(ref);
}

class DashboardLayoutService {
  DashboardLayoutService(DashboardLayoutServiceRef ref) {
    ref.onDispose(dispose);
  }

  /// Returns the default dashboard layout. Defined by me
  DashboardLayout defaultDashboardLayout() {
    return DashboardLayout(name: 'Default', tabs: [
      DashboardTab(name: 'General', icon: 'nozzle', components: [
        DashboardComponent(type: DashboardComponentType.webcam),
        DashboardComponent(type: DashboardComponentType.machineStatus),
        DashboardComponent(type: DashboardComponentType.temperatureSensorPreset),
        DashboardComponent(type: DashboardComponentType.controlXYZ),
        // DashboardComponent(type: DashboardComponentType.zOffset),
        // DashboardComponent(type: DashboardComponentType.spoolman),
      ]),
      DashboardTab(name: 'Control', icon: 'sliders', components: [
        DashboardComponent(type: DashboardComponentType.controlExtruder),
        DashboardComponent(type: DashboardComponentType.fans),
        DashboardComponent(type: DashboardComponentType.groupedSliders),
        DashboardComponent(type: DashboardComponentType.pins),
        // DashboardComponent(type: DashboardComponentType.powerApi),
        DashboardComponent(type: DashboardComponentType.bedMesh),
        DashboardComponent(type: DashboardComponentType.macroGroup),
      ]),
    ]);
  }

  /// Returns an empty dashboard layout with one empty tab
  DashboardLayout emptyDashboardLayout() {
    return DashboardLayout(name: 'Empty', tabs: [
      emptyDashboardTab('nozzle'),
      emptyDashboardTab('sliders'),
    ]);
  }

  /// Returns an empty dashboard tab
  DashboardTab emptyDashboardTab([String icon = 'nozzle']) {
    return DashboardTab(name: 'Empty', icon: icon, components: []);
  }

  DashboardLayout importFromJson(Map<String, dynamic> json) {
    // THIS IS NOT HOW ITS ACTUALLY IMPLEMENTED
    return defaultDashboardLayout();
  }

  Future<DashboardLayout> fetchDashboardLayoutForMachine(Machine machine) async {
    // THIS IS NOT HOW ITS ACTUALLY IMPLEMENTED
    return defaultDashboardLayout();
  }

  Future<void> saveDashboardLayoutForMachine(String machineUUID, DashboardLayout layout) async {
    // THIS IS NOT HOW ITS ACTUALLY IMPLEMENTED
  }

  Future<List<DashboardLayout>> availableLayouts() async {
    // THIS IS NOT HOW ITS ACTUALLY IMPLEMENTED
    return <DashboardLayout>[];
  }

  Future<void> persistLayout(DashboardLayout layout) async {
    // THIS IS NOT HOW ITS ACTUALLY IMPLEMENTED
    logger.i('Persisting dashboard layout ${layout.name} (${layout.uuid})');
  }

  Future<void> removeLayout(DashboardLayout layout) async {
    // THIS IS NOT HOW ITS ACTUALLY IMPLEMENTED
    logger.i('Removing dashboard layout ${layout.name} (${layout.uuid})');
  }

  bool validateLayout(DashboardLayout layout, [bool throwIfError = false]) {
    // THIS IS NOT HOW ITS ACTUALLY IMPLEMENTED
    return true;
  }

  void dispose() {
    logger.i('DashboardLayoutService disposed');
  }
}
