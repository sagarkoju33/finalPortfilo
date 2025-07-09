import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/model/experience_model.dart';
import 'package:portfolio/view/experience/components/experience_controller.dart';
import '../../../res/constants.dart';

class ExperienceDetails extends StatelessWidget {
  final controller = Get.put(ExperienceController());
  ExperienceDetails({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      // height: double.infinity,
      // width: double.infinity,
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
              child: Text(
                experienceList[index].title,
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
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  experienceList[index].company,
                  style: const TextStyle(color: Colors.amber, fontSize: 12),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Text(
                    experienceList[index].duration,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
              ],
            ),

            const SizedBox(height: defaultPadding / 2),
            ListView.builder(
              itemCount: experienceList[index].responsibilities.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, responsibilitiesIndex) {
                var e = experienceList[index]
                    .responsibilities[responsibilitiesIndex];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.check_mark_circled_solid,
                      color: Colors.green,
                      size: 16,
                    ),
                    const SizedBox(width: defaultPadding / 2),
                    Expanded(
                      child: Text(
                        e,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}
