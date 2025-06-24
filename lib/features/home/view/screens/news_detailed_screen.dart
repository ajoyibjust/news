import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/widgets/my_text.dart';

class NewsDetailedScreen extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String deta;

  const NewsDetailedScreen({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.deta,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.bookmark_border, size: 20, color: Colors.black),
                    SizedBox(width: 16),
                    Icon(Icons.share, size: 20, color: Colors.black),
                  ],
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.network(image, fit: BoxFit.cover),
              ),

              SizedBox(height: 15),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(title, size: 20, fontWeight: FontWeight.bold),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-4.0.3&auto=format&fit=crop&w=100&q=80',
                          ),
                          backgroundColor: Colors.grey[300],
                        ),
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [MyText('By Andy Corbley')],
                        ),
                        Spacer(),
                        MyText(deta.split("T")[0]),
                      ],
                    ),
                    SizedBox(height: 20),

                    MyText(description, size: 16, fontWeight: FontWeight.w500),

                    SizedBox(height: 15),

                    MyText(description, size: 16, fontWeight: FontWeight.w500),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
