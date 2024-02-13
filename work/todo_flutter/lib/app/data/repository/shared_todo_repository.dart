import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_flutter/app/interactor/repository/repository_todo.dart';

import '../../interactor/models/todo_model.dart';
import '../adapters/todo_adapters.dart';

const _key = 'TODO_LIST';

class SharedTodoRepository implements RepositoryTodo {
  @override
  Future<List<TodoModel>> getAll() async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key);
    if (json == null) return [];
    final list = jsonDecode(json) as List;
    return list.map((e) => TodoAdapters.fromMap(e)).toList();
  }

  @override
  Future<TodoModel> insert(TodoModel model) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;
    final id = list.isEmpty ? 1 : list.last['id'] + 1;
    final newModel = model.copyWith(id: id);
    list.add(TodoAdapters.toMap(newModel));
    await shared.setString(_key, jsonEncode(list));
    return newModel;
  }

  @override
  Future<TodoModel> update(TodoModel model) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;
    final index = list.indexWhere((e) => e['id'] == model.id);
    if (index == -1) throw Exception('Todo not found');
    list[index] = TodoAdapters.toMap(model);
    await shared.setString(_key, jsonEncode(list));
    return model;
  }

  @override
  Future<bool> delete(int id) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;
    final index = list.indexWhere((e) => e['id'] == id);
    if (index == -1) return false;
    list.removeAt(index);
    await shared.setString(_key, jsonEncode(list));
    return true;
  }
}
