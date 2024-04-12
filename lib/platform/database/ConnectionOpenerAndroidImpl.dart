import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'ConnectionOpener.dart';

class ConnectionOpenerImpl implements ConnectionOpener {

  ConnectionOpenerImpl() {
    debugPrint("Android実装が選択されました。");
  }

  @override
  LazyDatabase openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      if (Platform.isAndroid) {
        await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      }

      final String cachebase = (await getTemporaryDirectory()).path;
      sqlite3.tempDirectory = cachebase;

      return NativeDatabase.createInBackground(file);
    });
  }
}