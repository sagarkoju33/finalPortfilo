import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';

class MyPortfolioText extends GetWidget<PortfolioController> {
  const MyPortfolioText({super.key, required this.start, required this.end});
  final double start;
  final double end;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return TweenAnimationBuilder(
          tween: Tween(begin: start, end: end),
          duration: const Duration(milliseconds: 200),
          builder: (context, value, child) {
            return Obx(
              () => Text(
                "${controller.portfolioData.value?.intro?.welcomeText ?? ""} ${controller.portfolioData.value?.intro?.firstName ?? ""} ${controller.portfolioData.value?.intro?.lastName ?? ""}",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  height: 0,

                  fontSize: value,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
