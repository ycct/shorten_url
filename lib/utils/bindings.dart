import 'package:get/get.dart';
import 'package:shorten_url/controller/home_controller.dart';

class HomeViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
    );
  }
}

