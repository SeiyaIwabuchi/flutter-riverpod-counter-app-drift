import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:practice1/database/database.dart';

import 'ConnectionOpener.dart';

class ConnectionOpenerImpl implements ConnectionOpener {

  ConnectionOpenerImpl() {
    debugPrint("web実装が選択されました。");
  }

  @override
  QueryExecutor openConnection() {
    return DatabaseConnection.delayed(Future(() async {
      final result = await WasmDatabase.open(
        databaseName: 'decks_db',
        sqlite3Uri: Uri.parse('sqlite3.wasm'),
        driftWorkerUri: Uri.parse('drift_worker.js'),
      );

      if (result.missingFeatures.isNotEmpty) {
        print('Using ${result.chosenImplementation} due to missing browser '
            'features: ${result.missingFeatures}');
      }

      return result.resolvedExecutor;
    }));
  }
}