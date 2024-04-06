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
  Future<CountEntity> decrement() async {

    final CountEntity current = await _counterRepository.getCurrent();
    
    _counterRepository.save(current.copy(current.count - 1));

    return _counterRepository.getCurrent();
  }

  //
  //
  @override
  Future<CountEntity> increment() async {

    final CountEntity current = await _counterRepository.getCurrent();

    _counterRepository.save(current.copy(current.count + 1));

    return await _counterRepository.getCurrent();
  }

  //
  //
  @override
  Future<CountEntity> reset() async {
    
    _counterRepository.save(CountEntity(0));

    return await _counterRepository.getCurrent();
  }

  //
  @override
  Future<CountEntity> getCurrent() async {
    return await _counterRepository.getCurrent();
  }
}
