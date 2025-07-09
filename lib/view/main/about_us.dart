import 'package:flutter/material.dart';

import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/view%20model/responsive.dart';
import 'package:portfolio/view/projects/components/title_text.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isLargeMobile(context))
            const SizedBox(height: defaultPadding),
          const TitleText(prefix: 'About', title: 'Us'),
          const SizedBox(height: defaultPadding),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "I am currently refining my expertise in Flutter, a robust UI toolkit that enables the development of seamless cross-platform applications from a single codebase. I have successfully built several innovative applications, including a Corona Detector App, a CV App, and a Notes App, each demonstrating my ability to transform concepts into functional and elegant solutions.In addition to hands-on development, I have also produced educational content in the form of tutorials on Flutter, Dart, and Firebase, which I have shared on my YouTube channel to support and inspire fellow learners. My work reflects a strong commitment to combining creativity with technical precision, while actively contributing to the wider developer community.",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w900,
                height: 0,
                wordSpacing: 2,
                fontSize: Responsive.isDesktop(context) ? 16 : 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Expanded(
          //     child: Responsive(
          //         desktop: ProjectGrid(
          //           crossAxisCount: 3,
          //         ),
          //         extraLargeScreen: ProjectGrid(
          //           crossAxisCount: 4,
          //         ),
          //         largeMobile: ProjectGrid(crossAxisCount: 1, ratio: 1.8),
          //         mobile: ProjectGrid(crossAxisCount: 1, ratio: 1.5),
          //         tablet: ProjectGrid(
          //           ratio: 1.4,
          //           crossAxisCount: 2,
          //         )))
        ],
      ),
    );
  }
}
