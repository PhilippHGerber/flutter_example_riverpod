import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model.dart';
import 'provider.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    return Table(
      children: [
        const TableRow(
          decoration: BoxDecoration(color: Colors.grey),
          children: [
            Text('Title'),
            Text('Description'),
            Text('Completed'),
          ],
        ),
        ...todos.map((todo) => TableRow(
              children: [
                Text(todo.title),
                Text(todo.description),
                TodoCompleted(todo: todo),
              ],
            )),
      ],
    );
  }
}

class TodoCompleted extends ConsumerWidget {
  const TodoCompleted({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Checkbox(
      value: todo.completed,
      onChanged: (completed) {
        if (completed != null) {
          todo.completed = completed;
          ref.read(todoListProvider.notifier).update(todo);
        }
      },
    );
  }
}
