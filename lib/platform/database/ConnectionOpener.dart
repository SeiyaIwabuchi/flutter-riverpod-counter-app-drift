import 'package:drift/drift.dart';

abstract class ConnectionOpener {
  QueryExecutor openConnection();
}