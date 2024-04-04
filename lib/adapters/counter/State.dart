import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends Notifier<CounterState> {

  @override
  CounterState build() {
    return CounterState.init();
  }


  // ----
  //
  void update(CounterState newState) {
    state = newState;
  }

  CounterState current () => state;

}

class CounterState {

  // Notifier
  static final notifierProvider = NotifierProvider<CounterNotifier, CounterState>(CounterNotifier.new);

  // ----
  // 状態

  final int count;

  CounterState(this.count);

  CounterState copy([int? count]) {
    return CounterState(
      count ?? this.count
    );
  }

  factory CounterState.init() {
    return CounterState(0);
  }
}