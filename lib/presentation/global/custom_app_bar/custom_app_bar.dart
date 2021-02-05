import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  final String titleText;
  final double height;

  CustomAppBar({@required this.titleText, this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      alignment: Alignment.center,
      child: Text(titleText,
          style: Theme.of(context).appBarTheme.textTheme.headline6),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.color,
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Theme.of(context).appBarTheme.shadowColor,
          ),
        ),
      ),
    );
  }
}
