import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';
import 'package:portfolio/view/projects/components/project_detail.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/project_model.dart';
import '../../../res/constants.dart';

class ProjectStack extends GetWidget<PortfolioController> {
  const ProjectStack({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onHover: (value) {
      //   controller.onHover(index, value);
      // },
      onTap: () {
        launchUrl(
          Uri.parse(
            controller.portfolioData.value!.projects![index].link ?? "",
          ),
        );
        // ImageViewer(context, projectList[index].image);
      },
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        padding: const EdgeInsets.only(
          left: defaultPadding,
          right: defaultPadding,
          top: defaultPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: bgColor,
        ),
        duration: const Duration(milliseconds: 500),
        child: ProjectDetail(index: index),
      ),
    );
  }
}
