import 'package:flutter/material.dart';
import 'package:github_repository_finder/data/api/service/hive/hive_db.dart';
import 'package:github_repository_finder/internal/application.dart';
import 'package:github_repository_finder/internal/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Routes.createRoutes(); // Creates named routes

  /// Local storage initialization
  await HiveDb.init();

  runApp(Application());
}
