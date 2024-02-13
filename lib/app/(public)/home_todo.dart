import 'package:asp/asp.dart';

import 'package:flutter/material.dart';

import '../interactor/action/todo_action.dart';
import '../interactor/atoms/todo_atom.dart';
import '../interactor/models/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  void editTodoDialog([TodoModel? model]) {
    model ??= TodoModel(id: -1, product: '', check: false, description: '');
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Todo'),
          content: SizedBox(
            height: 120,
            child: Column(
              children: [
                TextFormField(
                  initialValue: model?.product,
                  onChanged: (value) {
                    model = model!.copyWith(product: value);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: model?.description,
                  onChanged: (value) {
                    model = model!.copyWith(description: value);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                delete(model!.id);
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                //Atualiza
                putTodo(model!);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (_) {
        final todos = todoState.value;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Page'),
          ),
          body: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (_, index) {
              final todo = todos[index];
              return GestureDetector(
                onLongPress: () {
                  editTodoDialog(todo);
                },
                child: CheckboxListTile(
                  value: todo.check,
                  title: Text(todo.product),
                  subtitle: Text(todo.description),
                  secondary: Text(todo.id.toString()),
                  onChanged: (value) {
                    putTodo(
                      todo.copyWith(check: value!),
                    );
                  },
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: editTodoDialog,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
