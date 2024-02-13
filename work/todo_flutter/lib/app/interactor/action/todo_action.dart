import 'package:todo_flutter/app/interactor/repository/repository_todo.dart';

import '../../injector/injector.dart';
import '../atoms/todo_atom.dart';
import '../models/todo_model.dart';

Future<void> fetchTodos() async {
  final repository = injector.get<RepositoryTodo>();
  todoState.value = await repository.getAll();
}

Future<void> putTodo(TodoModel model) async {
  final repository = injector.get<RepositoryTodo>();

  if (model.id == -1) {
    await repository.insert(model);
  } else {
    await repository.update(model);
  }
  // reload list
  fetchTodos();
}

Future<void> delete(int id) async {
  final repository = injector.get<RepositoryTodo>();
  await repository.delete(id);
  fetchTodos();
}
