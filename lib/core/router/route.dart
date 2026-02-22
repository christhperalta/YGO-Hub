import 'package:go_router/go_router.dart';
import 'package:ygo_hub/feature/ygo/presentation/screen/details/details_screen.dart';
import 'package:ygo_hub/feature/ygo/presentation/screen/home/home_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),

    GoRoute(
      path: '/details',
      builder: (context, state) {
        return const DetailsScreen();
      },
    ),
  ],
);
