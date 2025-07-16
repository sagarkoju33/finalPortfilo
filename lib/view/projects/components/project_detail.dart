import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:portfolio/view/projects/components/project_link.dart';

import '../../../model/project_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/portfolio_controller.dart';
import '../../../view model/responsive.dart';

class ProjectDetail extends GetWidget<PortfolioController> {
  final int index;
  const ProjectDetail({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Obx(
            () => Text(
              controller.portfolioData.value!.projects![index].title ?? "",

              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Responsive.isMobile(context)
            ? const SizedBox(height: defaultPadding / 2)
            : const SizedBox(height: defaultPadding),
        Obx(
          () => Text(
            controller.portfolioData.value!.projects![index].description ?? "",
            style: const TextStyle(color: Colors.grey, fontSize: 12),
            maxLines: size.width > 700 && size.width < 750
                ? 2
                : size.width < 470
                ? 4
                : size.width > 600 && size.width < 700
                ? 6
                : size.width > 900 && size.width < 1060
                ? 6
                : 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        ProjectLinks(index: index),
        const SizedBox(height: defaultPadding / 2),
      ],
    );
  }
}
