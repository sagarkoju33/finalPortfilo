import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

class ScreenSizeController extends GetxController with WidgetsBindingObserver {
  final screenWidth = 0.0.obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    screenWidth.value = WidgetsBinding.instance.window.physicalSize.width /
        WidgetsBinding.instance.window.devicePixelRatio;
    super.onInit();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    screenWidth.value = WidgetsBinding.instance.window.physicalSize.width /
        WidgetsBinding.instance.window.devicePixelRatio;
  }
}
