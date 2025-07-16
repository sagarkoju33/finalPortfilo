import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';
import '../../../res/constants.dart';
import 'education_details.dart';

class CertificateGrid extends GetWidget<PortfolioController> {
  final int crossAxisCount;
  final double ratio;
  const CertificateGrid({super.key, this.crossAxisCount = 3, this.ratio = 2});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.portfolioData.value?.education?.isNotEmpty ?? false)
          ? GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              itemCount: controller.portfolioData.value?.education?.length ?? 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: ratio,
              ),
              itemBuilder: (context, index) {
                return Obx(
                  () => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(
                      vertical: defaultPadding,
                      horizontal: defaultPadding,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [Colors.pinkAccent, Colors.blue],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink,
                          offset: const Offset(-2, 0),
                          blurRadius: controller.hovers[index] ? 20 : 10,
                        ),
                        BoxShadow(
                          color: Colors.blue,
                          offset: const Offset(2, 0),
                          blurRadius: controller.hovers[index] ? 20 : 10,
                        ),
                      ],
                    ),
                    child: CertificateStack(index: index),
                  ),
                );
              },
            )
          : Center(child: const CircularProgressIndicator()),
    );
  }
}
