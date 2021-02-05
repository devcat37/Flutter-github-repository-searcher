part of 'search_result_cubit.dart';

@immutable
abstract class SearchResultState {}

class SearchResultLoading extends SearchResultState {}

class SearchResultLoaded extends SearchResultState {}
