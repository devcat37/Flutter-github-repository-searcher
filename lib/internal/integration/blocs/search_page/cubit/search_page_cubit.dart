import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'search_page_state.dart';

class SearchPageCubit extends Cubit<SearchPageState> {
  final TextEditingController repoController = TextEditingController();

  SearchPageCubit() : super(SearchPageInitial());

  Future<void> searchRepositories({@required String repositoryName}) async {
    if (state is SearchPageInitial || state is SearchPageLoadedError) {
      if (repositoryName.isNotEmpty) {
        emit(SearchPageLoading());
        print('[DEBUG]: Entered text is ' + repositoryName);
        return Future.delayed(
          Duration(milliseconds: 2500),
          () async {
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
