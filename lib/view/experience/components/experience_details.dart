import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/portfolio_controller.dart';

class ExperienceDetails extends GetWidget<PortfolioController> {
  const ExperienceDetails({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: bgColor,
      ),
      duration: const Duration(milliseconds: 500),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Obx(
                () => Text(
                  controller.portfolioData.value?.experience?[index].title ??
                      "",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Obx(
                    () => Text(
                      controller
                              .portfolioData
                              .value
                              ?.experience?[index]
                              .company ??
                          "",
                      style: const TextStyle(color: Colors.amber, fontSize: 12),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Obx(
                    () => Text(
                      controller
                              .portfolioData
                              .value
                              ?.experience?[index]
                              .period ??
                          "",
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: defaultPadding / 2),
            Obx(
              () => ListView.builder(
                itemCount:
                    controller
                        .portfolioData
                        .value
                        ?.experience?[index]
                        .description
                        ?.length ??
                    0,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, responsibilitiesIndex) {
                  var e = controller
                      .portfolioData
                      .value
                      ?.experience?[index]
                      .description?[responsibilitiesIndex];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.check_mark_circled_solid,
                          color: Colors.green,
                          size: 12,
                        ),
                        const SizedBox(width: defaultPadding / 2),
                        Expanded(
                          child: Text(
                            e ?? "",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}
