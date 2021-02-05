import 'package:github_repository_finder/data/api/request/request_body.dart';

class SearchRepositoryBody extends RequestBody {
  final String repositoryName;

  SearchRepositoryBody(this.repositoryName);

  @override
  Map<String, dynamic> toApi() {
    return {
      'name': repositoryName,
    };
  }
}
