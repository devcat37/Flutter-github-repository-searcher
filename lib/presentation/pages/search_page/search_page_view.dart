import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository_finder/internal/integration/blocs/search_page/cubit/search_page_cubit.dart';
import 'package:github_repository_finder/presentation/global/custom_app_bar/custom_app_bar.dart';
import 'package:github_repository_finder/presentation/widgets/search_page/search_text_field.dart';

class SearchPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'ПОИСК'),
      body: BlocBuilder<SearchPageCubit, SearchPageState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 85.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SearchTextField(
                    onSearchButtonPressed: () => context
                        .read<SearchPageCubit>()
                        .searchRepositories(
                            repositoryName: context
                                .read<SearchPageCubit>()
                                .repoController
                                .text),
                    repoController:
                        context.read<SearchPageCubit>().repoController,
                  ),
                ],
              ),
              if (state is SearchPageLoading || state is SearchPageLoadedError)
                Column(
                  children: [
                    SizedBox(height: 25.0),
                    if (state is SearchPageLoading)
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                      ),
                    if (state is SearchPageLoadedError)
                      Text(
                        state.message,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Theme.of(context).errorColor),
                      ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
