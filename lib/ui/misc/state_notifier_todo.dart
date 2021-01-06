import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/ui/misc/to-do.dart';

class TodoList extends StateNotifier<List<TodoItem>> {
  TodoList([List<TodoItem> todos]) : super(todos ?? []);

  void add(String title) {
    state = [
      ...state,
      new TodoItem(
          userId: state.length + 1,
          completed: false,
          id: state.length + 1,
          title: title)
    ];
  }

  void remove(num id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void toggle(num id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          TodoItem(
              userId: todo.userId,
              id: todo.id,
              completed: !todo.completed,
              title: todo.title)
        else
          todo
    ];
  }
}
