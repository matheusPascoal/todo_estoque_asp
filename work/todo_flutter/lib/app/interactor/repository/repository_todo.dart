import 'package:todo_flutter/app/interactor/models/todo_model.dart';

abstract class RepositoryTodo {
  Future<List<TodoModel>> getAll();
  Future<TodoModel> insert(TodoModel model);
  Future<TodoModel> update(TodoModel model);
  Future<bool> delete(int id);
}
