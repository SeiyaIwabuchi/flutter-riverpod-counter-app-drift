import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice1/repos/counter/CounterRepositoryImpl.dart';
import 'package:practice1/service/counter/CounterRepository.dart';

/// Providerを定義しているクラス

class ReposPrv {
  static final Provider<CounterRepository> counterRepositoryProvider =
      Provider((ref) => CounterRepositoryImpl());
}
