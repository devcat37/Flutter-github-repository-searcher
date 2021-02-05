import 'package:flutter/material.dart';
import 'package:github_repository_finder/domain/model/github_repository/github_repository.dart';
import 'package:github_repository_finder/presentation/widgets/search_result_page/repository_container.dart';

class RepositoryList extends StatelessWidget {
  final List<GithubRepository> repos;
  RepositoryList({this.repos});

  @override
  Widget build(BuildContext context) {
    List<Widget> _list = [];
    for (var i = 0; i < repos.length; i++) {
      _list.add(RepositoryContainer(repo: repos.elementAt(i)));
      _list.add(SizedBox(height: 16.0));
    }
    return Column(
      children: _list,
    );
  }
}
