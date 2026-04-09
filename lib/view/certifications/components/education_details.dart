import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/model/education_model.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';

class CertificateStack extends GetWidget<PortfolioController> {
  const CertificateStack({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.portfolioData.value?.education?[index].link != null
            ? launchUrl(Uri.parse(educationList[index].link))
            : null;
      },
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        padding: const EdgeInsets.all(defaultPadding),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: bgColor,
        ),
        duration: const Duration(milliseconds: 500),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.portfolioData.value?.education?[index].degree ?? "",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: defaultPadding),
              Text(
                controller.portfolioData.value?.education?[index].institution ??
                    "",
                style: const TextStyle(color: Colors.amber, fontSize: 12),
              ),

              const SizedBox(height: defaultPadding / 2),

              Text.rich(
                maxLines: kIsWeb
                    ? 3
                    : GetPlatform.isIOS
                    ? 2
                    : 2,
                TextSpan(
                  text: 'Description : ',
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                  children: [
                    TextSpan(
                      text:
                          controller
                              .portfolioData
                              .value
                              ?.education?[index]
                              .description ??
                          "",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  controller.portfolioData.value?.education?[index].duration ??
                      "",
                  style: const TextStyle(color: Colors.amber, fontSize: 12),
                ),
              ),
              const SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
