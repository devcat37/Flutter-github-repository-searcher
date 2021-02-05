class ApiGithubRepository {
  final String name;
  final num stargazersCount;
  final String lastUpdateTime;
  final Map<String, dynamic> owner;

  ApiGithubRepository({
    this.name,
    this.stargazersCount,
    this.lastUpdateTime,
    this.owner,
  });

  static ApiGithubRepository fromApi(Map<String, dynamic> map) {
    return ApiGithubRepository(
      name: map['name'],
      stargazersCount: num.parse(map['stargazers_count'].toString()),
      lastUpdateTime: map['updated_at'],
      owner: map['owner'],
    );
  }
}
