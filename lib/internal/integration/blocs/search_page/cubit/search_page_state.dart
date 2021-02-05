part of 'search_page_cubit.dart';

@immutable
abstract class SearchPageState {}

class SearchPageInitial extends SearchPageState {}

class SearchPageLoading extends SearchPageState {}

class SearchPageLoadedSuccess extends SearchPageState {}

class SearchPageLoadedError extends SearchPageState {
  final String message;

  SearchPageLoadedError(this.message);
}
