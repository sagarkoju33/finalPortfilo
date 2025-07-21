import 'dart:async';

import 'package:get/get.dart';
import 'package:portfolio/core/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // Timer(const Duration(seconds: 1), () {
    //   Navigator.pushReplacement(
    //     Get.context!,
    //     MaterialPageRoute(builder: (context) => const HomePage()),
    //   );
    // });
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.homeScreen);
    });
    super.onInit();
  }
}
