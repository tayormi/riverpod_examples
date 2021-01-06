import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorToggleProvider = StateProvider<String>((ref) => '');

final colorProvider = Provider<String>((ref) {
  final color = ref.watch(colorToggleProvider);
  return color.state = 'Red';
});

class StateProviderScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final color = watch(colorToggleProvider).state;
    return Scaffold(
      backgroundColor: color == 'Red' ? Colors.red : Colors.blue,
      appBar: AppBar(
        title: Text('State Provider Example'),
      ),
      body: Container(
        child: Center(
          child: Text('Toggle Color'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(colorToggleProvider).state =
            color == 'Red' ? 'Blue' : 'Red',
        child: Icon(Icons.legend_toggle),
      ),
    );
  }
}
