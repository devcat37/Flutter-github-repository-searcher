import 'dart:convert';

import 'package:github_repository_finder/data/api/model/github_repository/api_github_repository.dart';
import 'package:github_repository_finder/data/api/request/github_repository/cache_repositories_body.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveDb {
  static const _REPOS = 'repositories';

  static Future<void> init() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    Hive.init(appDocumentDirectory.path);
    // await Hive.openBox('constants');
  }

  Future<void> clearRepositories() async {
    await Hive.openBox(_REPOS);
    await Hive.box(_REPOS).clear();
  }

  Future<List<ApiGithubRepository>> fetchRepositories() async {
    List<ApiGithubRepository> _apiList = [];

    await Hive.openBox(_REPOS);
    for (var i = 0; i < Hive.box(_REPOS).length; i++) {
      _apiList.add(
          ApiGithubRepository.fromApi(jsonDecode(Hive.box(_REPOS).getAt(i))));
    }
    //for (var i = 0; i < _response.data['items'].length; i++) {
    //_apiList.add(ApiGithubRepository.fromApi(_response.data['items'][i]));
    //}
    return _apiList;
  }

  Future<void> cacheRepository(CacheRepositoryBody body) async {
    await Hive.openBox(_REPOS);
    await Hive.box(_REPOS).add(
      jsonEncode(body.toApi()),
    );
    print(Hive.box(_REPOS).getAt(0));
  }
}
