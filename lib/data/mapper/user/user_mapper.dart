import 'package:github_repository_finder/data/api/model/user/api_user.dart';
import 'package:github_repository_finder/domain/model/user/user.dart';

class UserMapper {
  static User fromApi(ApiUser api) {
    return User(
      login: api.login,
      avatarUrl: api.avatarUrl,
    );
  }
}
