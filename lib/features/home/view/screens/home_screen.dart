import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/extension/sizedbox_extension.dart';
import 'package:news/core/utils/my_image.dart';
import 'package:news/core/widgets/my_text.dart';
import 'package:news/features/home/view/providers/news_provider.dart';
import 'package:news/features/home/view/widgets/categories_body.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  Future<bool> checkImage(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsync = ref.watch(newsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Spacer(),
                    Image.asset(MyImage.logo, width: 30),
                    MyText("News 24", size: 18, fontWeight: FontWeight.w600),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.push("/notifications");
                      },
                      child: Icon(Icons.notifications_none_outlined),
                    ),
                  ],
                ),
              ),
              CategoriesBody(),
              30.height,
              newsAsync.when(
                loading: () => Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text(e.toString())),
                data: (articles) => ListView.builder(
                  padding: EdgeInsets.all(15),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final data = articles[index];
                    return GestureDetector(
                      onTap: () {
                        context.push(
                          "/newsDetailed",
                          extra: {
                            "image": data.urlToImage,
                            "title": data.title,
                            "description": data.description,
                            "deta": data.publishedAt,
                          },
                        );
                      },
                      child: FutureBuilder<bool>(
                        future: checkImage(data.urlToImage ?? ""),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SizedBox.shrink();
                          }

                          if (snapshot.hasData && snapshot.data == true) {
                            return Column(
                              children: [
                                Row(
                                  spacing: 15,
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      height: 120,
                                      child: Image.network(
                                        data.urlToImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 5,
                                        children: [
                                          MyText(
                                            data.title,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          MyText(data.author ?? ""),
                                          Row(
                                            children: [
                                              MyText(
                                                data.publishedAt.split("T")[0],
                                              ),
                                              Spacer(),
                                              Icon(Icons.more_horiz),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Divider(),
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
