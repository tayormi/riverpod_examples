import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_examples/ui/misc/api.dart';
import 'package:riverpod_examples/ui/misc/to-do.dart';

final todoProvider = FutureProvider.autoDispose<TodoItem>((ref) async {
  return Api().getData();
});

class FutureProviderScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<TodoItem> todo = watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Provider Screen'),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: data(todo)),
    );
  }

  Widget data(AsyncValue<TodoItem> todo) {
    return todo.when(
        data: (data) {
          return ListTile(
            leading: Text('${data.id}'),
            title: Text('${data.title}'),
          );
        },
        loading: () => Center(child: const CircularProgressIndicator()),
        error: (err, stack) => Text("An Error has occured"));
  }
}
