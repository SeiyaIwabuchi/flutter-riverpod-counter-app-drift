import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice1/service/counter/CountEntity.dart';
import 'package:practice1/service/counter/CounterRepository.dart';
import 'package:practice1/service/counter/CounterService.dart';

class CounterServiceImpl implements CounterService {

  final CounterRepository _counterRepository;

  CounterServiceImpl(this._counterRepository);

  //
  //
  @override
  CountEntity decrement() {

    final CountEntity current = _counterRepository.getCurrent();
    
    _counterRepository.save(current.copy(current.count - 1));

    return _counterRepository.getCurrent();
  }

  //
  //
  @override
  CountEntity increment() {

    final CountEntity current = _counterRepository.getCurrent();

    _counterRepository.save(current.copy(current.count + 1));

    return _counterRepository.getCurrent();
  }

  //
  //
  @override
  CountEntity reset() {
    
    _counterRepository.save(CountEntity(0));

    return _counterRepository.getCurrent();
  }
}
