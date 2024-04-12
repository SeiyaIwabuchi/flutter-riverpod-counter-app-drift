import 'dart:io';

import 'package:drift/drift.dart';
import 'package:practice1/platform/database/ConnectionOpenerImpl.dart';


/// databaseの定義

part 'database.g.dart';

//テーブル定義とORMの設定
class Counter extends Table {
  IntColumn get current => integer()();
}

@DriftDatabase(tables: [Counter])
class AppDatabase extends _$AppDatabase {
  AppDatabase._(): super(ConnectionOpenerImpl().openConnection());


  @override
  int get schemaVersion => 1;

  // ----

  //
  static AppDatabase? _appDatabase;

  //
  static AppDatabase getInstance() {
    _appDatabase ??= AppDatabase._();

    initDb();
    return _appDatabase!;
  }

  static void initDb() async {
    AppDatabase db = _appDatabase!;

    print("既存データ：${await db.counter.select().get()}");
    if (await db.counter.count().getSingle() == 0) {
      print("初期データ投入！");
      await db.into(db.counter)
          .insert(CounterCompanion.insert(current: 0));
    }
  }
}