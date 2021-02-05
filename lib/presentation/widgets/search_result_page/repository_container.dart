import 'package:flutter/material.dart';
import 'package:github_repository_finder/domain/model/github_repository/github_repository.dart';

class RepositoryContainer extends StatelessWidget {
  final GithubRepository repo;

  RepositoryContainer({this.repo});

  var _list = [
    'Января',
    'Февраля',
    'Марта',
    'Апреля',
    'Мая',
    'Июня',
    'Июля',
    'Августа',
    'Сентября',
    'Октября',
    'Ноября',
    'Декабря'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      height: 110.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 1.0, color: Color(0xFFDFDFDF)),
      ),
      child: Column(
        children: [
          SizedBox(height: 12.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(repo.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold)),
                Container(
                  height: 24.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFA6A6A6),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.star_outline,
                            size: 16.0, color: Colors.white),
                        Text(
                          repo.stargazersCount.toString().substring(0, 3),
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                SizedBox(width: 16.0),
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(repo.owner.avatarUrl))),
                ),
                SizedBox(width: 8.0),
                Text(repo.owner.login,
                    style: Theme.of(context).textTheme.headline6)
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            height: 1.0,
            color: Color(0xFFDFDFDF),
          ),
          SizedBox(height: 12.0),
          Row(
            children: [
              SizedBox(width: 16.0),
              Text('Обновлено: ',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Color(0xFFA6A6A6))),
              Text(
                repo.lastUpdateTime.day.toString() +
                    ' ' +
                    _list[repo.lastUpdateTime.month - 1],
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          )
        ],
      ),
    );
  }
}
