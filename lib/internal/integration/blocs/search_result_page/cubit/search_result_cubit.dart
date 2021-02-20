import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:github_repository_finder/data/api/api_util.dart';
import 'package:github_repository_finder/data/repository/github_repository/github_repository_data_repository.dart';
import 'package:github_repository_finder/domain/model/github_repository/github_repository.dart';
import 'package:github_repository_finder/domain/repository/github_repository/github_repository_repository.dart';
import 'package:github_repository_finder/internal/routes/routes.dart';
import 'package:meta/meta.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  List<GithubRepository> repos;

  final GithubRepositoryRepository _githubRepositoryRepository =
      GithubRepositoryDataRepository(ApiUtil());

  SearchResultCubit() : super(SearchResultLoading());

  Future<void> fetchRepositories() async {
    repos = await _githubRepositoryRepository.fetchRepositories();
    emit(SearchResultLoaded());
  }

  Future<void> routeToSearchPage(BuildContext context) async {
    return Navigator.of(context).pop();
  }
}
