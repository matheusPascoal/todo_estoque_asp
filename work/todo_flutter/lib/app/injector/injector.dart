import 'package:auto_injector/auto_injector.dart';
import 'package:todo_flutter/app/interactor/repository/repository_todo.dart';

import '../data/repository/shared_todo_repository.dart';

final injector = AutoInjector();

void registerInstances() {
  injector.add<RepositoryTodo>(SharedTodoRepository.new);
}
