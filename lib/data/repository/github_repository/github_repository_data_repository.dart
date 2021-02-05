import 'package:flutter/material.dart';
import 'package:github_repository_finder/data/api/api_util.dart';
import 'package:github_repository_finder/domain/model/github_repository/github_repository.dart';
import 'package:github_repository_finder/domain/repository/github_repository/github_repository_repository.dart';

class GithubRepositoryDataRepository extends GithubRepositoryRepository {
  final ApiUtil _apiUtil;

  GithubRepositoryDataRepository(this._apiUtil);

  @override
  Future<List<GithubRepository>> searchRepositories({@required String repositoryName}) {
    return _apiUtil.searchRepositories(repositoryName: repositoryName);
  }
}
