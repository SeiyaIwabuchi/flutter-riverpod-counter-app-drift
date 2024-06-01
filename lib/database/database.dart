import 'dart:io';

import 'package:drift/drift.dart';
import 'package:practice1/platform/database/ConnectionOpenerImpl.dart';


/// databaseの定義

part 'database.g.dart';

//テーブル定義とORMの設定
class Note extends Table {
  Int64Column get id => int64()();
  TextColumn get owner => text()();
  TextColumn get title => text()();
  TextColumn get body => text()();
}

@DriftDatabase(tables: [Note])
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
    // 初期データなど

    AppDatabase db = _appDatabase!;
  }
}