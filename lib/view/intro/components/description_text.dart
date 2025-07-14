import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';

class AnimatedDescriptionText extends GetWidget<PortfolioController> {
  const AnimatedDescriptionText({
    super.key,
    required this.start,
    required this.end,
  });
  final double start;
  final double end;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Obx(
          () => Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              controller.portfolioData.value?.intro?.description ?? "",
              // textAlign: TextAlign.justify,
              // maxLines: 1,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey,
                wordSpacing: 2,
                fontSize: value,
              ),
            ),
          ),
        );
      },
    );
  }
}
