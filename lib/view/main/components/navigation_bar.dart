import 'package:flutter/material.dart';
import 'package:portfolio/view%20model/responsive.dart';
import 'package:portfolio/view/intro/components/side_menu_button.dart';
import 'package:portfolio/view/main/components/connect_button.dart';
import '../../../res/constants.dart';
import 'navigation_button_list.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: MenuButton(onTap: () => Scaffold.of(context).openDrawer()),
          ),
          const Spacer(),
          if ((!Responsive.isLargeMobile(context)) &&
              !(Responsive.isTablet(context)))
            NavigationButtonList(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: defaultPadding),
            child: const ConnectButton(),
          ),
          // const Spacer(),
        ],
      ),
    );
  }
}
