import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/res/constants.dart' show bgColor, defaultPadding;
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';
import 'package:portfolio/view%20model/responsive.dart';

import 'drawer_image.dart';

class About extends GetWidget<PortfolioController> {
  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        color: bgColor,
        child: Column(
          children: [
            SizedBox(height: 10),
            const Spacer(flex: 2),
            const DrawerImage(),
            const Spacer(),
            Obx(
              () => Text(
                controller.portfolioData.value?.about?.name ?? "",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: defaultPadding / 4),
            Obx(
              () => Text(
                controller.portfolioData.value?.about?.description1 ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w200, height: 1.5),
              ),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  controller.portfolioData.value?.about?.description2 ?? "",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w900,
                    height: 0,
                    wordSpacing: 2,
                    fontSize: Responsive.isDesktop(context) ? 10 : 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // const Spacer(flex: 2),
            Divider(),
          ],
        ),
      ),
    );
  }
}
