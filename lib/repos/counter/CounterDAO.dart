
import '../../commons/shared_preferences_wrapper.dart';
import '../../service/counter/CountEntity.dart';

// ----
//

enum PrefKeys {
  counter
}

class CounterDAO {

  // ---
  //

  static CounterDAO? _counterDAO;

  static CounterDAO getInstance() {
    _counterDAO ??= CounterDAO();
    return _counterDAO!;
  }

  late final SharedPreferencesWrapper _prefsw;

  CounterDAO() {
    _prefsw = SharedPreferencesWrapper.getInstance();
  }

  // ----
  //

  Future<CountEntity> getCurrent()  async {
    final int current = await _prefsw.getIntOrNull(PrefKeys.counter) ?? 0;

    return CountEntity(current);
  }

  //
  //
  void save(CountEntity entity) {
    _prefsw.setInt(PrefKeys.counter, entity.count);
  }
}