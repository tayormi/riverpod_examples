import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_examples/ui/misc/counter.dart';

final counterProvider = ChangeNotifierProvider<Counter>((ref) => Counter());

class ChangeNotifierScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final count = watch(counterProvider).count;
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Notifier Screen'),
      ),
      body: Center(
        child: Text('${count.toString()}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(counterProvider).increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
