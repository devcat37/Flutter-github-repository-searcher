import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository_finder/internal/integration/blocs/search_page/cubit/search_page_cubit.dart';
import 'package:github_repository_finder/presentation/pages/search_page/search_page_view.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchPageCubit(),
      child: SearchPageView(),
    );
  }
}
