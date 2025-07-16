import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/certification_controller.dart';
import 'package:portfolio/view/projects/components/title_text.dart';
import '../../res/constants.dart';
import '../../view model/responsive.dart';
import 'components/education_grid.dart';

class Education extends StatelessWidget {
  final controller = Get.put(CertificationController());
  Education({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isLargeMobile(context))
            const SizedBox(height: defaultPadding),
          const TitleText(prefix: 'My', title: 'Education'),
          const SizedBox(height: defaultPadding),
          Expanded(
            child: Responsive(
              desktop: CertificateGrid(crossAxisCount: 2, ratio: 2),
              extraLargeScreen: CertificateGrid(crossAxisCount: 4, ratio: 2),
              largeMobile: CertificateGrid(crossAxisCount: 1),
              mobile: CertificateGrid(crossAxisCount: 1, ratio: 1.5),
              tablet: CertificateGrid(crossAxisCount: 1, ratio: 2),
            ),
          ),
        ],
      ),
    );
  }
}
