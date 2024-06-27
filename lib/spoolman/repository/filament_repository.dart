/*
 * Copyright (c) 2023-2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:common/data/dto/pagination_result.dart';
import 'package:common/network/jrpc_client_provider.dart';
import 'package:common/service/moonraker/klippy_service.dart';
import 'package:common/util/extensions/async_ext.dart';
import 'package:common/util/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/filament.dart';
import 'filament_repository_impl.dart';

part 'filament_repository.g.dart';

@riverpod
FilamentRepository filamentRepository(FilamentRepositoryRef ref, String machineUUID) {
  var jsonRpcClient = ref.watch(jrpcClientProvider(machineUUID));

  var moonrakerVersion = ref.watch(klipperProvider(machineUUID).selectAs((data) => data.moonrakerVersion)).valueOrNull;
  // Prior to v0.8.0-331, there was no counts in the V2 response, but V2 was available. However, we will start using V2 from v0.8.0-331
  // V1/V2 explained: https://moonraker.readthedocs.io/en/latest/web_api/?h=proxy#proxy
  // Commit adding counts/headers: https://github.com/Arksine/moonraker/commit/c857e1a99f76777a3247bc47bfe5a5fceeaad947
  var useV2 = (moonrakerVersion?.compareTo(0, 8, 0, 331) ?? -1) >= 0;

  logger.i('Instantiating FilamentRepository with Moonraker-Response-Version: ${useV2 ? 'V2' : 'V1'}');

  return FilamentRepositoryImpl(jsonRpcClient, useV2);
}

abstract mixin class FilamentRepository {
  Future<Filament> create(Filament filament);

  Future<Filament?> read(int id);

  Future<Filament> update(Filament filament);

  Future<Filament> delete(Filament filament);

  Future<PaginationResult<Filament>> paginated({int? pageSize, int? page, Map<String, dynamic>? filters});
}
