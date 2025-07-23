import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';
import 'package:portfolio/view/main/components/drawer/personal_info.dart';
import '../../../../res/constants.dart';
import 'about.dart';
import 'my_skill.dart';

class CustomDrawer extends GetWidget<PortfolioController> {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,

      child: SingleChildScrollView(
        child: Column(
          children: [
            const About(),
            Container(
              color: bgColor,
              child: Padding(
                padding: EdgeInsets.all(defaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PersonalInfo(),
                    MySKills(),

                    // ContactIcon(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
