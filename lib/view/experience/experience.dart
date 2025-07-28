import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/certification_controller.dart';
import 'package:portfolio/view/experience/components/experience_grid.dart';
import 'package:portfolio/view/projects/components/title_text.dart';
import '../../res/constants.dart';
import '../../view model/responsive.dart';

class Experience extends StatelessWidget {
  final controller = Get.put(CertificationController());
  Experience({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isLargeMobile(context))
            const SizedBox(height: defaultPadding),
          const TitleText(prefix: 'My', title: 'Experience'),
          const SizedBox(height: defaultPadding),
          Expanded(
            child: Responsive(
              desktop: ExperienceGrid(crossAxisCount: 2, ratio: 2),
              extraLargeScreen: ExperienceGrid(crossAxisCount: 4, ratio: 1.6),
              largeMobile: ExperienceGrid(crossAxisCount: 1, ratio: 1.8),
              mobile: ExperienceGrid(crossAxisCount: 1, ratio: 1.4),
              tablet: ExperienceGrid(ratio: 1.7, crossAxisCount: 2),
            ),
          ),
        ],
      ),
    );
  }
}
