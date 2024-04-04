import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice1/adapters/counter/State.dart';
import 'package:practice1/providers/AdapterPrv.dart';

import 'adapters/counter/Adapter.dart';

void main() {
  runApp(
    const ProviderScope(
        child: MaterialApp(
          home: MyApp(),
        )
    )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    final int count = ref.watch(CounterState.notifierProvider).count;
    final Adapter adapter = ref.read(AdapterProvider.counterAdapterPrv);

    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("ただのカウンター"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => adapter.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}