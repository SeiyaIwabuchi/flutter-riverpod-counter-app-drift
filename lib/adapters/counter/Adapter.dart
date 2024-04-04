import 'package:practice1/service/counter/CounterService.dart';

import 'State.dart';

class Adapter {


  final CounterService _counterService;

  final CounterNotifier _counterNotifier;

  Adapter(this._counterService, this._counterNotifier);


  // ----

  //
  //
  void increment() {
    CounterState current = _counterNotifier.current();
    _counterNotifier.update(current.copy(_counterService.increment().count));
  }


  //
  //
  void decrement() {
    CounterState current = _counterNotifier.current();
    _counterNotifier.update(current.copy(_counterService.decrement().count));
  }


  //
  //
  void reset() {
    CounterState current = _counterNotifier.current();
    _counterNotifier.update(current.copy(_counterService.reset().count));
  }
}