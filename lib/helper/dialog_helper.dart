import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertHelper {
  AlertHelper._();

  static void closeWaitWidget() {
    Get.closeOverlay();
  }

  static void waitWidget() {
    Get.dialog(
      barrierColor: Colors.white.withAlpha(80),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: const Center(child: LoadingWidget()),
      ),
      id: "loading_wait",
    );
  }

  static void showFlushBar({
    required String message,
    double? verticalMargin,
    bool error = false,
    int? duration,
  }) async {
    Get.snackbar(
      "",
      "",
      backgroundColor: error ? Color(0xFFE75C3A) : Colors.green,
      duration: Duration(milliseconds: duration ?? 1500),
      icon: Icon(error ? Icons.error : Icons.check_circle, color: Colors.white),
      titleText: Padding(
        padding: const EdgeInsets.only(top: 08),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(message, style: const TextStyle(color: Colors.white)),
            ),
            GestureDetector(
              onTap: () {
                Get.closeAllSnackbars();
              },
              child: const Icon(Icons.clear, color: Colors.white),
            ),
          ],
        ),
      ),
      messageText: const SizedBox.shrink(),
      // Use this to hide the default message
      snackStyle: SnackStyle.floating,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 08),
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: verticalMargin ?? 20,
      ),
      snackPosition: SnackPosition.bottom,
    );
  }
}

class LoadingWidget extends StatelessWidget {
  final double size;
  final double height;
  final MainAxisAlignment mainAxisAlignment;
  const LoadingWidget({
    super.key,
    this.size = 92.0,
    this.height = 120,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height - height,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        children: [CircularProgressIndicator(strokeWidth: 2)],
      ),
    );
  }
}
