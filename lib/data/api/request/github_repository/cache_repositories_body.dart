import 'package:github_repository_finder/data/api/request/request_body.dart';
import 'package:github_repository_finder/data/api/request/user/cache_user_body.dart';
import 'package:github_repository_finder/domain/model/github_repository/github_repository.dart';

class CacheRepositoryBody extends RequestBody {
  final String name;
  final num stargazersCount;
  final String lastUpdateTime;
  final Map<String, dynamic> owner;

  CacheRepositoryBody.fromRepository(GithubRepository rep)
      : name = rep.name,
        stargazersCount = rep.stargazersCount,
        lastUpdateTime = rep.lastUpdateTime.toIso8601String(),
        owner = CacheUserBody.fromUser(rep.owner).toApi();

  @override
  Map<String, dynamic> toApi() {
    return {
      'name': name,
      'stargazers_count': stargazersCount,
      'updated_at': lastUpdateTime,
      'owner': owner,
    };
  }
}
