import 'package:flutter/material.dart';
import 'package:github_repository_finder/internal/application.dart';
import 'package:github_repository_finder/internal/routes/routes.dart';

void main() {
  Routes.createRoutes(); // Creates named routes

  runApp(Application());
}
