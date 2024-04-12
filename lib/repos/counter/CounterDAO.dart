import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../../database/database.dart';
import '../../service/counter/CountEntity.dart';

class CounterDAO {
  // ---
  //

  static CounterDAO? _counterDAO;

  static CounterDAO getInstance() {
    _counterDAO ??= CounterDAO();
    return _counterDAO!;
  }

  late final AppDatabase _appDatabase;

  CounterDAO() {
    _appDatabase = AppDatabase.getInstance();
  }

  // ----
  //

  Future<CountEntity> getCurrent() async {
    print("getCurrentが呼ばれた！");
    final int current =
        (await (_appDatabase.counter.select()..limit(1)).getSingleOrNull())?.current ?? 0;
    return CountEntity(current);
  }

  //
  //
  void save(CountEntity entity) {
    print("saveが呼ばれた！");
    _appDatabase.counter.update().write(CounterCompanion(current: Value(entity.count)));
  }
}
