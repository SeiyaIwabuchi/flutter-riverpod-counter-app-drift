import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:flutter/cupertino.dart';

import 'ConnectionOpener.dart';

class ConnectionOpenerImpl implements ConnectionOpener {

  ConnectionOpenerImpl() {
    debugPrint("未知の実装が選択されました。");
  }

  @override
  QueryExecutor openConnection() {
    throw UnsupportedError("実装クラスが正しく選択されませんでした。");
  }
}