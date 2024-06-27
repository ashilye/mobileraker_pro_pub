/*
 * Copyright (c) 2023-2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'dart:async';

import 'package:common/data/dto/jrpc/rpc_response.dart';
import 'package:common/data/dto/pagination_result.dart';
import 'package:common/util/extensions/ref_extension.dart';
import 'package:common/util/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobileraker_pro/spoolman/dto/filament.dart';
import 'package:mobileraker_pro/spoolman/dto/spool.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../spoolman/dto/vendor.dart';
import '../../spoolman/repository/filament_repository.dart';
import '../../spoolman/repository/spool_repository.dart';
import '../../spoolman/repository/vendor_repository.dart';
import '../../spoolman/spoolman_server_info.dart';

part 'spoolman_service.g.dart';

@riverpod
SpoolmanService spoolmanService(SpoolmanServiceRef ref, String machineUUID) {
  return SpoolmanService(ref, machineUUID);
}

@riverpod
Stream<Spool?> activeSpool(ActiveSpoolRef ref, String machineUUID) async* {
  ref.keepAliveFor();
  // THATS NOT HOW ITS ACTUALLY IMPLEMENTED
  yield null;
}

@riverpod
Future<SpoolmanServerInfo> spoolmanServerInfo(SpoolmanServerInfoRef ref, String machineUUID) async {
  var service = ref.watch(spoolmanServiceProvider(machineUUID));
  return service.getServerInfo();
}

@riverpod
Future<PaginationResult<Spool>> spoolList(SpoolListRef ref, String machineUUID,
    {int? page, int? pageSize, Map<String, dynamic>? filters}) async {
  var service = ref.watch(spoolmanServiceProvider(machineUUID));
  ref.keepAliveFor();

  return service.spoolList(pageSize: pageSize, page: page, filter: filters);
}

@riverpod
Future<PaginationResult<Filament>> filamentList(FilamentListRef ref, String machineUUID,
    {int? page, int? pageSize, Map<String, dynamic>? filters}) async {
  var service = ref.watch(spoolmanServiceProvider(machineUUID));

  ref.keepAliveFor();
  return service.filamentList(pageSize: pageSize, page: page, filter: filters);
}

@riverpod
Future<PaginationResult<Vendor>> vendorList(VendorListRef ref, String machineUUID,
    {int? page, int? pageSize, Map<String, dynamic>? filters}) async {
  var service = ref.watch(spoolmanServiceProvider(machineUUID));

  ref.keepAliveFor();
  return service.vendorList(pageSize: pageSize, page: page, filter: filters);
}

// uses the spoolman API & proxy of moonraker
class SpoolmanService {
  static final RegExp qrCodeRegEx = RegExp(r'^web\+spoolman:s-(?<id>[0-9]+)$');

  SpoolmanService(AutoDisposeRef ref, String machineUUID)
      : _vendorRepository = ref.watch(vendorRepositoryProvider(machineUUID)),
        _spoolRepository = ref.watch(spoolRepositoryProvider(machineUUID)),
        _filamentRepository = ref.watch(filamentRepositoryProvider(machineUUID));

  final VendorRepository _vendorRepository;
  final SpoolRepository _spoolRepository;
  final FilamentRepository _filamentRepository;

  final StreamController<Spool?> _activeSpoolStreamController = StreamController();

  Stream<Spool?> get activeSpoolStream => _activeSpoolStreamController.stream;

  Future<PaginationResult<Spool>> spoolList({int? pageSize, int? page, Map<String, dynamic>? filter}) async {
    // if (page != null && page > 0) throw Exception("Dummy");
    logger.i('Trying to get spool list (PageSize $pageSize, page $page)...');
    return _spoolRepository.paginated(pageSize: pageSize, page: page, filters: filter);
  }

  Future<PaginationResult<Filament>> filamentList({int? pageSize, int? page, Map<String, dynamic>? filter}) async {
    logger.i('Trying to get filament list...');
    return _filamentRepository.paginated(pageSize: pageSize, page: page, filters: filter);
  }

  Future<PaginationResult<Vendor>> vendorList({int? pageSize, int? page, Map<String, dynamic>? filter}) async {
    logger.i('Trying to get vendor list...');
    return _vendorRepository.paginated(pageSize: pageSize, page: page, filters: filter);
  }

  Future<Spool?> spool(int id) async {
    logger.i('Trying to get spool $id...');
    // THATS NOT HOW ITS ACTUALLY IMPLEMENTED
    return null;
  }

  Future<RpcResponse> setActiveSpool(Spool spool) async {
    logger.i('Trying to set active spool to $spool');
    // THATS NOT HOW ITS ACTUALLY IMPLEMENTED
    return const RpcResponse(jsonrpc: "", id: 1, result: {});
  }

  Future<RpcResponse> clearActiveSpool() async {
    logger.i('Trying to clear active spool...');
    // THATS NOT HOW ITS ACTUALLY IMPLEMENTED
    return const RpcResponse(jsonrpc: "", id: 1, result: {});
  }

  Future<Spool?> getActiveSpool() async {
    logger.i('Trying to get active spool...');
    // THATS NOT HOW ITS ACTUALLY IMPLEMENTED
    return null;
  }

  Future<SpoolmanServerInfo> getServerInfo() async {
    logger.i('Trying to get server info...');
    // THATS NOT HOW ITS ACTUALLY IMPLEMENTED
    return const SpoolmanServerInfo(
      version: '0.0.1',
      debugMode: false,
      automaticBackups: false,
      dataDir: '/data',
      logsDir: '/logs',
      backupsDir: '/backups',
      dbType: 'sqlite',
      gitCommit: '123456',
      buildDate: '2023-01-01',
    );
  }
}
