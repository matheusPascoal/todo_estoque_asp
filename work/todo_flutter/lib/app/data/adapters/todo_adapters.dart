import 'package:todo_flutter/app/interactor/models/todo_model.dart';

class TodoAdapters {
  static Map<String, dynamic> toMap(TodoModel todo) {
    return {
      'id': todo.id,
      'product': todo.product,
      'check': todo.check,
      'description': todo.description
    };
  }

  static TodoModel fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      product: map['product'],
      check: map['check'],
      description: map['description'] ?? '',
    );
  }
}
