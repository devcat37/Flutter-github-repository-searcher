import 'package:flutter/material.dart';
import 'package:github_repository_finder/domain/model/user/user.dart';

class GithubRepository {
  final String name;
  final int stargazersCount;
  final DateTime lastUpdateTime;
  final User owner;

  GithubRepository({
    @required this.name,
    @required this.stargazersCount,
    @required this.lastUpdateTime,
    @required this.owner,
  });
}
