import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';
import '../../../res/constants.dart';
import 'education_details.dart';

class CertificateGrid extends GetWidget<PortfolioController> {
  const CertificateGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final educationList = controller.portfolioData.value?.education ?? [];
    final width = MediaQuery.of(context).size.width;

    // Responsive logic inside the widget
    int crossAxisCount;
    double ratio;
    log("rendering project detail for index: $width");
    if (width >= 1500) {
      crossAxisCount = 4;
      ratio = 1.6;
    } else if (width >= 1400) {
      crossAxisCount = 3;
      ratio = 2.2;
    } else if (width >= 1100) {
      crossAxisCount = 2;
      ratio = 2.4;
    } else if (width >= 800) {
      crossAxisCount = 2;
      ratio = 1.4;
    } else {
      crossAxisCount = 1;
      ratio = 2;
    }

    return educationList.isNotEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
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
              );
            },
          )
        : const Center(child: CircularProgressIndicator());
  }
}
