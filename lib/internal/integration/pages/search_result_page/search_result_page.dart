import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository_finder/internal/integration/blocs/search_result_page/cubit/search_result_cubit.dart';
import 'package:github_repository_finder/internal/integration/pages/search_result_page/search_result_page_args.dart';
import 'package:github_repository_finder/presentation/pages/search_result_page/search_result_page_view.dart';

class SearchResultPage extends StatelessWidget {
  final SearchResultPageArgs args;

  SearchResultPage(this.args);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchResultCubit()..fetchRepositories(),
      child: SearchResultPageView(args.queryName),
    );
  }
}
