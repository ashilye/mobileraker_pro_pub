/*
 * Copyright (c) 2023-2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:common/data/dto/pagination_result.dart';
import 'package:common/network/jrpc_client_provider.dart';
import 'package:common/service/moonraker/klippy_service.dart';
import 'package:common/util/extensions/async_ext.dart';
import 'package:common/util/logger.dart';
import 'package:mobileraker_pro/spoolman/dto/vendor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'vendor_repository_impl.dart';

part 'vendor_repository.g.dart';

@riverpod
VendorRepository vendorRepository(VendorRepositoryRef ref, String machineUUID) {
  var jsonRpcClient = ref.watch(jrpcClientProvider(machineUUID));

  var moonrakerVersion = ref.watch(klipperProvider(machineUUID).selectAs((data) => data.moonrakerVersion)).valueOrNull;
  // Prior to v0.8.0-331, there was no counts in the V2 response, but V2 was available. However, we will start using V2 from v0.8.0-331
  // V1/V2 explained: https://moonraker.readthedocs.io/en/latest/web_api/?h=proxy#proxy
  // Commit adding counts/headers: https://github.com/Arksine/moonraker/commit/c857e1a99f76777a3247bc47bfe5a5fceeaad947
  var useV2 = (moonrakerVersion?.compareTo(0, 8, 0, 331) ?? -1) >= 0;

  logger.i('Instantiating VendorRepository with Moonraker-Response-Version: ${useV2 ? 'V2' : 'V1'}');

  return VendorRepositoryImpl(jsonRpcClient, useV2);
}

abstract mixin class VendorRepository {
  Future<Vendor> create(Vendor vendor);

  Future<Vendor?> read(int id);

  Future<Vendor> update(Vendor vendor);

  Future<Vendor> delete(Vendor vendor);

  Future<PaginationResult<Vendor>> paginated({int? pageSize, int? page, Map<String, dynamic>? filters});
}
