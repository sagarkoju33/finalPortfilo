import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';

import '../../../../res/constants.dart';

class DrawerImage extends GetWidget<PortfolioController> {
  const DrawerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      padding: const EdgeInsets.all(defaultPadding / 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(colors: [Colors.pink, Colors.blue.shade900]),
        boxShadow: const [
          BoxShadow(color: Colors.pink, blurRadius: 10, offset: Offset(0, 2)),
          BoxShadow(color: Colors.blue, blurRadius: 10, offset: Offset(0, -2)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Obx(
          () => Transform.rotate(
            angle: 0.1,
            child: Image.network(
              controller.portfolioData.value?.profilePicture?.fileUrl ?? "",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
