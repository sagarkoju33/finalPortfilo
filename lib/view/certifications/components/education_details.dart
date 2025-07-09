import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/model/education_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/certification_controller.dart';

class CertificateStack extends StatelessWidget {
  final controller = Get.put(CertificationController());
  CertificateStack({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        controller.onHover(index, value);
      },
      onTap: () {
        educationList[index].link.isNotEmpty
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
                educationList[index].degree,
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
                educationList[index].institution,
                style: const TextStyle(color: Colors.amber, fontSize: 12),
              ),

              const SizedBox(height: defaultPadding / 2),
              Text.rich(
                maxLines: 2,
                TextSpan(
                  text: 'Description : ',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  children: [
                    TextSpan(
                      text: educationList[index].description,
                      style: const TextStyle(
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  " ${educationList[index].duration}",
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
