import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';
import 'package:portfolio/view/experience/components/experience_details.dart';
import '../../../res/constants.dart';

class ExperienceGrid extends GetWidget<PortfolioController> {
  final int crossAxisCount;
  final double ratio;

  const ExperienceGrid({super.key, this.crossAxisCount = 3, this.ratio = 2});

  @override
  Widget build(BuildContext context) {
    final experiences = controller.portfolioData.value?.experience ?? [];

    return experiences.isNotEmpty
        ? GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: experiences.length,
            physics: const BouncingScrollPhysics(),
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
                child: ExperienceDetails(index: index),
              );
            },
          )
        : const Center(child: CircularProgressIndicator());
  }
}
