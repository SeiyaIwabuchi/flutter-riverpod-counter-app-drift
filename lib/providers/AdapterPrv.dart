import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice1/adapters/counter/Adapter.dart';
import 'package:practice1/adapters/counter/State.dart';
import 'package:practice1/providers/ServicePrv.dart';

/// Providerを定義しているクラス

class AdapterProvider {
  //
  static final Provider<Adapter> counterAdapterPrv =
      Provider((ref) => Adapter(
          ref.read(ServicePrv.counterServiceProvider),
          ref.read(CounterState.notifierProvider.notifier)));
}
