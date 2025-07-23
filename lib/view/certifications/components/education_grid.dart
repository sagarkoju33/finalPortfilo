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
    final educationList = controller.portfolioData.value?.education ?? [];

    return educationList.isNotEmpty
        ? GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: educationList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: ratio,
            ),
            itemBuilder: (context, index) {
              return AnimatedContainer(
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
                      blurRadius: 20,
                    ),
                    BoxShadow(
                      color: Colors.blue,
                      offset: const Offset(2, 0),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: CertificateStack(index: index),
              );
            },
          )
        : const Center(child: CircularProgressIndicator());
  }
}
