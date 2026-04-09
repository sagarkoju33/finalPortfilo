import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/view%20model/getx_controllers/splash_controller.dart';
import 'package:portfolio/view/intro/components/animated_texts_componenets.dart';
import 'package:portfolio/view/splash/componenets/animated_loading_text.dart';

class SplashView extends GetWidget<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedImageContainer(width: 100, height: 100),
            SizedBox(height: defaultPadding),
            AnimatedLoadingText(),
          ],
        ),
      ),
    );
  }
}
