import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice1/repos/counter/CounterRepositoryImpl.dart';
import 'package:practice1/service/counter/CountEntity.dart';

abstract class CounterRepository {
  //
  //
  Future<CountEntity> getCurrent();

  //
  //
  void save(CountEntity entity);
}