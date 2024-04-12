// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CounterTable extends Counter with TableInfo<$CounterTable, CounterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CounterTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _currentMeta =
      const VerificationMeta('current');
  @override
  late final GeneratedColumn<int> current = GeneratedColumn<int>(
      'current', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [current];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'counter';
  @override
  VerificationContext validateIntegrity(Insertable<CounterData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('current')) {
      context.handle(_currentMeta,
          current.isAcceptableOrUnknown(data['current']!, _currentMeta));
    } else if (isInserting) {
      context.missing(_currentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CounterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CounterData(
      current: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current'])!,
    );
  }

  @override
  $CounterTable createAlias(String alias) {
    return $CounterTable(attachedDatabase, alias);
  }
}

class CounterData extends DataClass implements Insertable<CounterData> {
  final int current;
  const CounterData({required this.current});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['current'] = Variable<int>(current);
    return map;
  }

  CounterCompanion toCompanion(bool nullToAbsent) {
    return CounterCompanion(
      current: Value(current),
    );
  }

  factory CounterData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CounterData(
      current: serializer.fromJson<int>(json['current']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'current': serializer.toJson<int>(current),
    };
  }

  CounterData copyWith({int? current}) => CounterData(
        current: current ?? this.current,
      );
  @override
  String toString() {
    return (StringBuffer('CounterData(')
          ..write('current: $current')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => current.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CounterData && other.current == this.current);
}

class CounterCompanion extends UpdateCompanion<CounterData> {
  final Value<int> current;
  final Value<int> rowid;
  const CounterCompanion({
    this.current = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CounterCompanion.insert({
    required int current,
    this.rowid = const Value.absent(),
  }) : current = Value(current);
  static Insertable<CounterData> custom({
    Expression<int>? current,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (current != null) 'current': current,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CounterCompanion copyWith({Value<int>? current, Value<int>? rowid}) {
    return CounterCompanion(
      current: current ?? this.current,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (current.present) {
      map['current'] = Variable<int>(current.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CounterCompanion(')
          ..write('current: $current, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabase.connect(DatabaseConnection c) : super.connect(c);
  late final $CounterTable counter = $CounterTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [counter];
}
