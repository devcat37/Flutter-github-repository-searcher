import 'package:flutter/material.dart';
import 'package:github_repository_finder/domain/model/github_repository/github_repository.dart';

abstract class GithubRepositoryRepository {
  Future<List<GithubRepository>> searchRepositories({@required String repositoryName});
}
