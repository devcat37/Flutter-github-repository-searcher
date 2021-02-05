import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:github_repository_finder/data/api/api_util.dart';
import 'package:github_repository_finder/data/repository/github_repository/github_repository_data_repository.dart';
import 'package:github_repository_finder/domain/repository/github_repository/github_repository_repository.dart';
import 'package:meta/meta.dart';

part 'search_page_state.dart';

class SearchPageCubit extends Cubit<SearchPageState> {
  final TextEditingController repoController = TextEditingController();
  final GithubRepositoryRepository _githubRepositoryRepository =
      GithubRepositoryDataRepository(ApiUtil());

  SearchPageCubit() : super(SearchPageInitial());

  Future<void> searchRepositories({@required String repositoryName}) async {
    if (state is SearchPageInitial ||
        state is SearchPageLoadedError ||
        state is SearchPageLoadedSuccess) {
      if (repositoryName.isNotEmpty) {
        emit(SearchPageLoading());
        print('[DEBUG]: Entered text is ' + repositoryName);
        return Future.delayed(
          Duration(milliseconds: 1000),
          () async {
            var _list = await _githubRepositoryRepository.searchRepositories(
                repositoryName: repositoryName);

            print(_list.first.owner.login);
            emit(SearchPageLoadedSuccess());
          },
        );
      } else {
        emit(SearchPageLoadedError('Поле с названием пустое'));
      }
    }
    // emit(SearchPageInitial());
  }
}
