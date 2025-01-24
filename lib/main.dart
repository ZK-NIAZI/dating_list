import 'package:dating_list/app/dating_list.dart';
import 'package:flutter/material.dart';

import 'config/environment.dart';
import 'core/initializer/init_app.dart';

Future<void> main() async {
  await initApp(Environment.fromEnv(AppEnv.dev));
  runApp(const DatingList());
}

