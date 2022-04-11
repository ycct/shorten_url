import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:shorten_url/utils/bindings.dart';
import 'package:shorten_url/utils/routes.dart';
import 'package:shorten_url/theme/theme.dart';
import 'package:shorten_url/utils/translation.dart';
import 'package:shorten_url/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: HomeViewBinding(),
        defaultTransition: Transition.cupertino,
        debugShowCheckedModeBanner: false,
        initialRoute: "/home",
        getPages: AppRoutes.routes,
        locale: const Locale("en", "US"),
        fallbackLocale: const Locale('en', 'UK'),
        translations: Translation(),
        home:  HomeView(),
        theme: CustomThemeData.lightTheme);
  }
}
