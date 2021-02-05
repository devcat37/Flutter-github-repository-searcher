import 'package:flutter/material.dart';

class ApiUser {
  final String avatarUrl;
  final String login;

  ApiUser({@required this.avatarUrl, @required this.login});

  static ApiUser fromApi(Map<String, dynamic> map) {
    return ApiUser(
      login: map['login'],
      avatarUrl: map['avatar_url'],
    );
  }
}
