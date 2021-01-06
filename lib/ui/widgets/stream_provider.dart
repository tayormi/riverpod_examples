import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_examples/ui/misc/number_creator.dart';

final numberProvider = StreamProvider.autoDispose<int>((ref) async* {
  final numberCreator = NumberCreator();

  ref.onDispose(() => numberCreator.controller.sink.close());

  await for (final value in numberCreator.stream) {
    if (value == 100) {
      numberCreator.controller.sink.close();
    }
    yield value;
  }
});

class StreamProviderScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<int> number = watch(numberProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Provider Example'),
      ),
      body: Container(child: Center(child: data(number))),
    );
  }

  Widget data(AsyncValue<int> number) {
    return number.when(
        data: (number) {
          return Text('$number');
        },
        loading: () => const CircularProgressIndicator(),
        error: (err, stack) => Text('An Error has occured'));
  }
}
