import 'package:practice1/service/counter/CounterService.dart';

import 'State.dart';

class Adapter {
  final CounterService _counterService;

  final CounterNotifier _counterNotifier;

  Adapter(this._counterService, this._counterNotifier);

  // ----

  //
  //
  Future<void> loadInitState() async {
    final CounterState initState =
        CounterState((await _counterService.getCurrent()).count);
    _counterNotifier.update(initState);
  }

  //
  //
  Future<void> increment() async {
    CounterState current = _counterNotifier.current();
    _counterNotifier
        .update(current.copy((await _counterService.increment()).count));
  }

  //
  //
  Future<void> decrement() async {
    CounterState current = _counterNotifier.current();
    _counterNotifier
        .update(current.copy((await _counterService.decrement()).count));
  }

  //
  //
  Future<void> reset() async {
    CounterState current = _counterNotifier.current();
    _counterNotifier
        .update(current.copy((await _counterService.reset()).count));
  }
}
