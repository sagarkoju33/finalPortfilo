import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/view%20model/controller.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';
import 'package:portfolio/view/main/components/navigation_bar.dart';

import '../../view model/responsive.dart';
import 'components/drawer/drawer.dart';
import 'components/navigation_button_list.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MainView extends GetWidget<PortfolioController> {
  const MainView({super.key, required this.pages});
  final List<Widget> pages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            kIsWeb && !Responsive.isLargeMobile(context)
                ? const SizedBox(height: defaultPadding * 2)
                : const SizedBox(height: defaultPadding / 2),
            const SizedBox(height: 80, child: TopNavigationBar()),
            if ((Responsive.isLargeMobile(context)) ||
                (Responsive.isTablet(context)))
              NavigationButtonList(),
            // const Row(children: [Spacer(), , Spacer()]),
            Expanded(
              flex: 9,
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                children: [...pages],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
