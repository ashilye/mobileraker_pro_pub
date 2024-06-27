/*
 * Copyright (c) 2023-2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:common/data/dto/pagination_result.dart';
import 'package:common/network/json_rpc_client.dart';
import 'package:common/util/logger.dart';

import '../dto/filament.dart';
import 'filament_repository.dart';

class FilamentRepositoryImpl with FilamentRepository {
  FilamentRepositoryImpl(JsonRpcClient jsonRpcClient, bool useV2Proxy);

  @override
  Future<Filament> create(Filament filament) {
    logger.i('Creating filament: $filament');
    return Future.value(filament);
  }

  @override
  Future<Filament> delete(Filament filament) {
    logger.i('Deleting filament: $filament');
    return Future.value(filament);
  }

  @override
  Future<PaginationResult<Filament>> paginated({int? pageSize, int? page, Map<String, dynamic>? filters}) {
    logger.i('Fetching paginated filaments');
    return Future.value(PaginationResult<Filament>([], 0, 0, 0));
  }

  @override
  Future<Filament?> read(int id) {
    logger.i('Reading filament with id: $id');
    return Future.value(null);
  }

  @override
  Future<Filament> update(Filament filament) {
    logger.i('Updating filament: $filament');
    return Future.value(filament);
  }
}
