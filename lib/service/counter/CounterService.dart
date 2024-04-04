import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice1/service/counter/CountEntity.dart';
import 'package:practice1/service/counter/CounterServiceImpl.dart';

abstract class CounterService {
  CountEntity increment();
  CountEntity decrement();
  CountEntity reset();
}