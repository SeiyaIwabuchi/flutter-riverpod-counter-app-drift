import 'package:practice1/repos/counter/CounterDAO.dart';
import 'package:practice1/service/counter/CountEntity.dart';
import 'package:practice1/service/counter/CounterRepository.dart';

class CounterRepositoryImpl implements CounterRepository {

  final CounterDAO _counterDAO = CounterDAO.getInstance();

  @override
  Future<CountEntity> getCurrent() async {
    return await _counterDAO.getCurrent();
  }

  @override
  void save(CountEntity entity) {
    _counterDAO.save(entity);
  }
  
}