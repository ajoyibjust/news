import 'package:flutter/material.dart';
import 'package:news/core/widgets/my_text.dart';

class CategoriesBody extends StatelessWidget {
  CategoriesBody({super.key});
  final List<String> _cate = ["For You", "Top", "World", "Politics", "Enter"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 15),
      child: Row(
        spacing: 15,
        children: List.generate(_cate.length, (index) {
          return FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              minimumSize: Size(0, 0),
            ),
            onPressed: () {},
            child: MyText(_cate[index], color: Colors.white),
          );
        }),
      ),
    );
  }
}
