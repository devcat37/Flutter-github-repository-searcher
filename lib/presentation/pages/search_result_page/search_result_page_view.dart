import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository_finder/internal/integration/blocs/search_result_page/cubit/search_result_cubit.dart';
import 'package:github_repository_finder/presentation/global/custom_app_bar/custom_app_bar.dart';
import 'package:github_repository_finder/presentation/widgets/search_result_page/repository_list.dart';

class SearchResultPageView extends StatelessWidget {
  final String queryName;

  SearchResultPageView(this.queryName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'РЕЗУЛЬТАТ ПОИСКА'),
      body: BlocBuilder<SearchResultCubit, SearchResultState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ПО ЗАПРОСУ: ',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Color(0xFFA6A6A6)),
                    ),
                    Text(
                      '"$queryName"',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  'НАЙДЕНО: ' +
                      ((state is SearchResultLoaded)
                          ? (context
                              .read<SearchResultCubit>()
                              .repos
                              .length
                              .toString())
                          : ('0')),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Color(0xFFA6A6A6)),
                ),
                SizedBox(height: 16.0),
                RepositoryList(
                    repos: (state is SearchResultLoaded)
                        ? (context.read<SearchResultCubit>().repos)
                        : ([]))
              ],
            ),
          );
        },
      ),
    );
  }
}
