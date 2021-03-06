import 'package:get/get.dart';
import 'package:shorten_url/utils/bindings.dart';
import 'package:shorten_url/views/home_view/home_view.dart';

class AppRoutes {
  static final routes = [
    // GetPage(
    //   name: '/splash',
    //   page: () => const SplashView(),
    // ),
    GetPage(
      name: '/home',
      page: () => const HomeView(),
      binding: HomeViewBinding(),
    ),
  ];
}
