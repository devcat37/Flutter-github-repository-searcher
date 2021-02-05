import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_repository_finder/data/api/model/github_repository/api_github_repository.dart';
import 'package:github_repository_finder/data/api/request/github_repository/search_repository_body.dart';

class Github {
  static const _REPO_URL = 'https://api.github.com/search/repositories?q=';

  Future<List<ApiGithubRepository>> searchRepositories(
      {@required SearchRepositoryBody body}) async {
    List<ApiGithubRepository> _apiList = [];
    var _dio = Dio(
      BaseOptions(baseUrl: _REPO_URL + body.toApi().values.first),
    );

    var _response = await _dio.get('');
    for (var i = 0; i < _response.data['items'].length; i++) {
      _apiList.add(ApiGithubRepository.fromApi(_response.data['items'][i]));
    }
    return _apiList;
  }
}
