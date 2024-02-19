import 'package:get/get.dart';

import '../Screen/home_screen.dart';
import '../Screen/initial_screen.dart';
import 'route_url.dart';

final List<GetPage<dynamic>> RoutePages = [
  GetPage(name: "/", page: () => const InitialScreen(), children: [
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
    ),
  ])
];
