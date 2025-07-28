import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/certification_controller.dart';
import 'package:portfolio/view/projects/components/title_text.dart';
import '../../res/constants.dart';
import '../../view model/responsive.dart';
import 'components/education_grid.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  final controller = Get.put(CertificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isLargeMobile(context))
                const SizedBox(height: defaultPadding),
              const TitleText(prefix: 'My', title: 'Education'),
              const SizedBox(height: defaultPadding),
              Expanded(child: const CertificateGrid()),
            ],
          );
        },
      ),
    );
  }
}
