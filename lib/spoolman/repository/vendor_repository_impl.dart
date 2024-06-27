/*
 * Copyright (c) 2023-2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:common/data/dto/pagination_result.dart';
import 'package:common/network/json_rpc_client.dart';
import 'package:common/util/logger.dart';
import 'package:mobileraker_pro/spoolman/dto/vendor.dart';

import 'vendor_repository.dart';

class VendorRepositoryImpl with VendorRepository {
  VendorRepositoryImpl(JsonRpcClient jsonRpcClient, bool useV2Proxy);

  @override
  Future<Vendor> create(Vendor vendor) {
    logger.i('Creating vendor: $vendor');
    return Future.value(vendor);
  }

  @override
  Future<Vendor> delete(Vendor vendor) {
    logger.i('Deleting vendor: $vendor');
    return Future.value(vendor);
  }

  @override
  Future<PaginationResult<Vendor>> paginated({int? pageSize, int? page, Map<String, dynamic>? filters}) {
    logger.i('Fetching paginated vendors');
    return Future.value(PaginationResult<Vendor>([], 0, 0, 0));
  }

  @override
  Future<Vendor?> read(int id) {
    logger.i('Reading vendor with id: $id');
    return Future.value(null);
  }

  @override
  Future<Vendor> update(Vendor vendor) {
    logger.i('Updating vendor: $vendor');
    return Future.value(vendor);
  }
}
