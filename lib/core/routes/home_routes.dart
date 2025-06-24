import 'package:go_router/go_router.dart';
import 'package:news/features/home/view/screens/home_screen.dart';
import 'package:news/features/home/view/screens/news_detailed_screen.dart';
import 'package:news/features/home/view/screens/notifications_screen.dart';

final homeRoutes = [
  GoRoute(path: "/", builder: (context, state) => HomeScreen()),
  GoRoute(path: "/notifications", builder: (context, state) => NotificationsScreen()),
  GoRoute(
    path: "/newsDetailed",
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>;
      return NewsDetailedScreen(
        image: extra["image"],
        title: extra["title"],
        description: extra["description"],
        deta: extra["deta"],
      );
    },
  ),
];
