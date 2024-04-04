import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice1/service/counter/CountEntity.dart';
import 'package:practice1/service/counter/CounterRepository.dart';

class CounterRepositoryImpl implements CounterRepository {

  static int _current = 0;
  
  @override
  CountEntity getCurrent() {
    return CountEntity(_current);
  }

  @override
  void save(CountEntity entity) {
    _current = entity.count;
  }
  
}