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
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: !Responsive.isLargeMobile(context)
                ? Image.asset('assets/images/triange_icon.png')
                : MenuButton(onTap: () => Scaffold.of(context).openDrawer()),
          ),
          Spacer(flex: 1),
          // if(Responsive.isLargeMobile(context)) MenuButton(),
          if (!Responsive.isLargeMobile(context)) NavigationButtonList(),
          Spacer(),

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
