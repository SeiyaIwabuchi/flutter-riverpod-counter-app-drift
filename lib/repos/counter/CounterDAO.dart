import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../../database/database.dart';
import '../../service/counter/CountEntity.dart';

class NoteDAO {
  // ---
  //

  static NoteDAO? _noteDAO;

  static NoteDAO getInstance() {
    _noteDAO ??= NoteDAO();
    return _noteDAO!;
  }

  late final AppDatabase _appDatabase;

  NoteDAO() {
    _appDatabase = AppDatabase.getInstance();
  }

  // ----
  //

  Future<NoteEntity?> findById({required int id}) async {
    final NoteData? note = await (_appDatabase.note.select()
          ..where((row) => row.id.equals(BigInt.from(id))))
        .getSingleOrNull();

    if (note != null) {
      return NoteEntity(
          id: note.id, owner: note.owner, title: note.title, body: note.body);
    }
    return null;
  }

  //
  //
  void save(NoteEntity entity) {
    _appDatabase.note.update().write(NoteCompanion(
        id: Value(entity.id),
        owner: Value(entity.owner),
        title: Value(entity.title),
        body: Value(entity.body)));
  }
}
