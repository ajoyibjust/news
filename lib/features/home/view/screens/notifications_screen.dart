import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/utils/My_image.dart';
import 'package:news/core/widgets/my_text.dart';

class NotificationsScreen extends StatelessWidget {
    const NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 8),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        title: MyText('Notifications', size: 18),
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E5EA),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Image.asset(MyImage.logo, width: 35),
                    title: MyText('Monarch population soars 4,900 percent...'),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: MyText('Science'),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E5EA),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    title: MyText('New app update available'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.grey[400],
                    ),
                  ),
                ),

                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Image.asset(MyImage.logo, width: 35),
                    title: MyText(
                      'Covid live: England hospitality bosses welcome lack of new restrictions; Japan reports first Omicron cluster',
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: MyText('World'),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Image.asset(MyImage.logo, width: 35),
                    title: MyText(
                      'NASA\'s \$10 billion James Webb Space Telescope Launches An Epic Mission To Study Early Universe',
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: MyText('Science'),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Image.asset(MyImage.logo, width: 35),
                    title: MyText(
                      'The Horrifying Star Wars Holidays Special Has Been Given An Unofficial 4K Upgrade',
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: MyText('Entertainment'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
