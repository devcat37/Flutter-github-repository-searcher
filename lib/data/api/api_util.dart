import 'package:flutter/material.dart';
import 'package:github_repository_finder/data/api/request/github_repository/cache_repositories_body.dart';
import 'package:github_repository_finder/data/api/request/github_repository/search_repository_body.dart';
import 'package:github_repository_finder/data/api/service/github/github.dart';
import 'package:github_repository_finder/data/api/service/hive/hive_db.dart';
import 'package:github_repository_finder/data/mapper/github_repository/github_repository_mapper.dart';
import 'package:github_repository_finder/domain/model/github_repository/github_repository.dart';

class ApiUtil {
  Future<List<GithubRepository>> searchRepositories(
      {@required String repositoryName}) async {
    var _body = SearchRepositoryBody(repositoryName);
    var _list = await Github().searchRepositories(body: _body);

    List<GithubRepository> _repList = [];
    for (var i = 0; i < _list.length; i++) {
      _repList.add(GithubRepositoryMapper.fromApi(_list.elementAt(i)));
    }

    return _repList;
  }

  Future<void> cacheRepository({@required GithubRepository repository}) async {
    var _body = CacheRepositoryBody.fromRepository(repository);
    await HiveDb().cacheRepository(_body);
  }

  Future<void> clearRepositories() async {
    await HiveDb().clearRepositories();
  }

  Future<List<GithubRepository>> fetchRepositories() async {
    var _list = await HiveDb().fetchRepositories();

    List<GithubRepository> _repList = [];
    for (var i = 0; i < _list.length; i++) {
      _repList.add(GithubRepositoryMapper.fromApi(_list.elementAt(i)));
    }
    return _repList;
  }
}
