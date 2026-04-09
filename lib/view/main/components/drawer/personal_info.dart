import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';

import '../../../../res/constants.dart';
import 'header_info.dart';

class PersonalInfo extends GetWidget<PortfolioController> {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: defaultPadding / 2),
        Obx(
          () => AreaInfoText(
            title: 'Contact',
            text: controller.portfolioData.value?.about?.contactNumber ?? "",
          ),
        ),
        Obx(
          () => AreaInfoText(
            title: 'Email',
            text: controller.portfolioData.value?.about?.emailAddress ?? "",
          ),
        ),
        Obx(
          () => AreaInfoText(
            title: 'LinkedIn',
            text: controller.portfolioData.value?.about?.linkedln ?? "",
          ),
        ),
        Obx(
          () => AreaInfoText(
            title: 'Github',
            text: controller.portfolioData.value?.about?.githubAccount ?? "",
          ),
        ),
        Divider(),
        SizedBox(height: defaultPadding),
        Text('Skills', style: TextStyle(color: Colors.white)),
        // SizedBox(height: defaultPadding),
      ],
    );
  }
}
