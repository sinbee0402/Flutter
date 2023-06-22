import 'package:bmi_calculator/main/main_screen.dart';
import 'package:bmi_calculator/result/result_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainScreen(),
      // 실행 안됨.
      // Exception: no routes for location /result?height=165&weight=55
      // routes: [
      //   GoRoute(
      //       path: 'result',
      //       builder: (context, state) {
      //         double height = double.parse(state.queryParameters['height']!);
      //         double weight = double.parse(state.queryParameters['weight']!);
      //
      //         return ResultScreen(height: height, weight: weight);
      //       })
      // ],
    ),
    GoRoute(
      path: '/main/result',
      builder: (context, state) {
        double height = double.parse(state.queryParameters['height']!);
        double weight = double.parse(state.queryParameters['weight']!);

        return ResultScreen(height: height, weight: weight);
      },
    ),
  ],
);
