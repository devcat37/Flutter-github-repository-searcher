import 'package:flutter/material.dart';
import 'package:github_repository_finder/internal/integration/pages/search_page/search_page.dart';
import 'package:github_repository_finder/internal/routes/routes.dart';
import 'package:github_repository_finder/internal/theme/theming.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Searcher',
      debugShowCheckedModeBanner: false,
      theme: Theming.currentTheme,
      onGenerateRoute: Routes.sailor.generator(),
      navigatorKey: Routes.sailor.navigatorKey,
      home: SearchPage(),
    );
  }
}
