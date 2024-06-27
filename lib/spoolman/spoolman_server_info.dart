/*
 * Copyright (c) 2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:common/util/extensions/object_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'spoolman_server_info.freezed.dart';
part 'spoolman_server_info.g.dart';

/*
{
    "version": "0.16.1",
    "debug_mode": false,
    "automatic_backups": true,
    "data_dir": "/home/pi/.local/share/spoolman",
    "logs_dir": "/home/pi/.local/share/spoolman",
    "backups_dir": "/home/pi/.local/share/spoolman/backups",
    "db_type": "sqlite",
    "git_commit": "babb95d",
    "build_date": null
}
 */
@freezed
class SpoolmanServerInfo with _$SpoolmanServerInfo {
  const SpoolmanServerInfo._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SpoolmanServerInfo({
    required String version,
    required bool debugMode,
    required bool automaticBackups,
    required String dataDir,
    required String logsDir,
    required String backupsDir,
    required String dbType,
    required String gitCommit,
    String? buildDate,
  }) = _SpoolmanServerInfo;

  factory SpoolmanServerInfo.fromJson(Map<String, dynamic> json) => _$SpoolmanServerInfoFromJson(json);

  int get versionMajor => version.split('.').elementAtOrNull(0)?.let(int.tryParse) ?? 0;

  int get versionMinor => version.split('.').elementAtOrNull(1)?.let(int.tryParse) ?? 0;

  int get versionPatch => version.split('.').elementAtOrNull(2)?.let(int.tryParse) ?? 0;

  int compareVersion(int major, int minor, int patch) {
    if (versionMajor != major) {
      return versionMajor.compareTo(major);
    } else if (versionMinor != minor) {
      return versionMinor.compareTo(minor);
    } else {
      return versionPatch.compareTo(patch);
    }
  }
}
