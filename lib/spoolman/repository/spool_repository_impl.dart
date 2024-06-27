/*
 * Copyright (c) 2023-2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:common/data/dto/pagination_result.dart';
import 'package:common/network/json_rpc_client.dart';
import 'package:common/util/logger.dart';
import 'package:mobileraker_pro/spoolman/dto/spool.dart';

import 'spool_repository.dart';

class SpoolRepositoryImpl with SpoolRepository {
  SpoolRepositoryImpl(JsonRpcClient jsonRpcClient, bool useV2Proxy);

  @override
  Future<Spool> create(Spool spool) {
    logger.i('Creating spool: $spool');
    return Future.value(spool);
  }

  @override
  Future<Spool> delete(Spool spool) {
    logger.i('Deleting spool: $spool');
    return Future.value(spool);
  }

  @override
  Future<PaginationResult<Spool>> paginated({int? pageSize, int? page, Map<String, dynamic>? filters}) {
    logger.i('Fetching paginated spools');
    return Future.value(PaginationResult<Spool>([], 0, 0, 0));
  }

  @override
  Future<Spool?> read(int id) {
    logger.i('Reading spool with id: $id');
    return Future.value(null);
  }

  @override
  Future<Spool> update(Spool spool) {
    logger.i('Updating spool: $spool');
    return Future.value(spool);
  }
}
