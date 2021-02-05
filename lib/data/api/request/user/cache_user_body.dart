import 'package:github_repository_finder/data/api/request/request_body.dart';
import 'package:github_repository_finder/domain/model/user/user.dart';

class CacheUserBody extends RequestBody {
  final String login;
  final String avatarUrl;

  CacheUserBody.fromUser(User user)
      : login = user.login,
        avatarUrl = user.avatarUrl;

  @override
  Map<String, dynamic> toApi() {
    return {
      'login': login,
      'avatar_url': avatarUrl,
    };
  }
}
