import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice1/providers/ReposPrv.dart';
import 'package:practice1/service/counter/CounterServiceImpl.dart';

import '../service/counter/CounterService.dart';

/// Providerを定義しているクラス

class ServicePrv {

  static final Provider<CounterService> counterServiceProvider = Provider(
      (ref) =>
          CounterServiceImpl(ref.read(ReposPrv.counterRepositoryProvider)));
}
