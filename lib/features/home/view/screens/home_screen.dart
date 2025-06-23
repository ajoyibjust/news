import 'package:flutter/material.dart';
import 'package:news/core/extension/sizedbox_extension.dart';
import 'package:news/core/utils/my_image.dart';
import 'package:news/core/widgets/my_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  Image.asset(MyImage.logo, width: 30),
                  MyText("News 24", size: 18, fontWeight: FontWeight.w600),
                  Spacer(),
                  Icon(Icons.notifications_none_outlined),
                ],
              ),
              20.height,
              Row(
                children: [
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      minimumSize: Size(0, 0),
                    ),
                    onPressed: () {},
                    child: Text("For You"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
