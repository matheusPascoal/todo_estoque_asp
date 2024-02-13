import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/app_widget.dart';
import 'app/injector/injector.dart';

GetIt getIt = GetIt.instance;
void main() {
  registerInstances();
  runApp(const AppWidget());
}
