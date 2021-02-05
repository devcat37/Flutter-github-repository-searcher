import 'package:flutter/material.dart';
import 'package:github_repository_finder/data/api/request/github_repository/search_repository_body.dart';
import 'package:github_repository_finder/data/api/service/github/github.dart';
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
}
