import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';
import 'package:portfolio/view/Blog/blog_screen.dart';
import 'package:portfolio/view/contact_us.dart';
import 'package:portfolio/view/intro/introduction.dart';
import 'package:portfolio/view/main/main_view.dart';
import 'package:portfolio/view/projects/project_view.dart';

import '../certifications/education.dart';
import '../experience/experience.dart';

// import 'package:web/web.dart' as web;
class HomePage extends GetWidget<PortfolioController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainView(
      pages: [
        const Introduction(),
        Experience(),
        ProjectsView(),
        Education(),
        const ContactUsForm(),
        BlogScreen(), // Assuming you have a BlogPage widget
      ],
    );
  }
}
