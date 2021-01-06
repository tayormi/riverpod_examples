import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_examples/ui/misc/state_notifier_todo.dart';

final todoListProvider = StateNotifierProvider((ref) => TodoList());

class StateNotifierScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final todoList = watch(todoListProvider.state);
    return Scaffold(
      appBar: AppBar(
        title: Text('State Notifier Screen'),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              for (final todo in todoList)
                CheckboxListTile(
                  onChanged: (value) =>
                      context.read(todoListProvider).toggle(todo.id),
                  value: todo.completed,
                  title: Text(todo.title),
                ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(todoListProvider).add('New Todo'),
        child: Icon(Icons.add),
      ),
    );
  }
}
