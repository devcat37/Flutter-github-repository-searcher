import 'package:github_repository_finder/data/api/model/github_repository/api_github_repository.dart';
import 'package:github_repository_finder/data/api/model/user/api_user.dart';
import 'package:github_repository_finder/data/mapper/user/user_mapper.dart';
import 'package:github_repository_finder/domain/model/github_repository/github_repository.dart';

class GithubRepositoryMapper {
  static GithubRepository fromApi(ApiGithubRepository api) {
    var _user = ApiUser.fromApi(api.owner);

    return GithubRepository(
      name: api.name,
      stargazersCount: api.stargazersCount.toInt(),
      lastUpdateTime: DateTime.tryParse(api.lastUpdateTime),
      owner: UserMapper.fromApi(_user),
    );
  }
}
