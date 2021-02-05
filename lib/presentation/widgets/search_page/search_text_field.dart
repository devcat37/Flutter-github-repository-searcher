import 'package:flutter/material.dart';
import 'package:github_repository_finder/internal/style/styling.dart';

class SearchTextField extends StatelessWidget {
  final Function onSearchButtonPressed;
  final TextEditingController repoController;

  SearchTextField({this.onSearchButtonPressed, this.repoController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(
          width: 1.0,
          color: Color(0xFFDFDFDF),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                controller: repoController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: onSearchButtonPressed,
                child: Container(
                  margin: EdgeInsets.all(4.0),
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF58AFFF),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Center(
                    child: Text('НАЙТИ', style: Styling.buttonText),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
