import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model.dart';


class TodoListNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() {
    return <Todo>[];
  }

  void add(Todo todo) {
    state = [...state, todo];
  }

  void remove(Todo todo) {
    state = state.where((t) => t != todo).toList();
  }

  void update(Todo todo) {
    state = state.map((t) => t == todo ? todo : t).toList();
  }
}

final todoListProvider = NotifierProvider<TodoListNotifier, List<Todo>>(TodoListNotifier.new);
