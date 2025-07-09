import 'package:flutter/material.dart';

import 'package:portfolio/view/intro/introduction.dart';
import 'package:portfolio/view/main/about_us.dart';
import 'package:portfolio/view/main/main_view.dart';
import 'package:portfolio/view/projects/project_view.dart';

import '../certifications/education.dart';
import '../experience/experience.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainView(
      pages: [
        const Introduction(),
        const AboutUs(),
        Experience(),
        ProjectsView(),
        Education(),
        // Certifications(),
      ],
    );
  }
}
