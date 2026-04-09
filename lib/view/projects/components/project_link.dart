import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../view model/getx_controllers/portfolio_controller.dart';

class ProjectLinks extends GetWidget<PortfolioController> {
  final int index;
  const ProjectLinks({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              const Flexible(
                child: Text(
                  'Check on Github',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {
                  launchUrl(
                    Uri.parse(
                      controller.portfolioData.value!.projects![index].link ??
                          "",
                    ),
                  );
                },
                icon: SvgPicture.asset('assets/icons/github.svg'),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            launchUrl(
              Uri.parse(
                controller.portfolioData.value!.projects![index].link ?? "",
              ),
            );
          },
          child: const Text(
            'Read More>>',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
