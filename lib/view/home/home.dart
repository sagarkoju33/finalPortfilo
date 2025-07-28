import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';
import 'package:portfolio/view/contact_us.dart';
import 'package:portfolio/view/intro/introduction.dart';
import 'package:portfolio/view/main/main_view.dart';
import 'package:portfolio/view/projects/project_view.dart';

import '../certifications/education.dart';
import '../experience/experience.dart';
// import 'package:web/web.dart' as web;
import '../../utils/web_reload.dart';

class HomePage extends GetWidget<PortfolioController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.portfolioData.value?.intro?.firstName?.isEmpty ?? false) {
      Future.microtask(() {
        Get.dialog(
          PopScope(
            canPop: false,
            child: AlertDialog(
              backgroundColor: bgColor,
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 40),
                    Text(
                      "Loading data, please wait...",
                      style: const TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        if (kIsWeb) {
                          reloadPage();
                        } else {
                          // Show dialog first if data is not yet loaded or still loading
                          if (controller
                                  .portfolioData
                                  .value
                                  ?.intro
                                  ?.firstName
                                  ?.isEmpty ??
                              true) {
                            showLoadingDialog();
                          }

                          // Load data
                          controller.loadPortfolioData();

                          // Close the dialog after loading
                          if (Get.isDialogOpen ?? false) {
                            Get.back();
                          }
                        }
                      },
                      child: Text("Refresh Data"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
    }

    return MainView(
      pages: [
        const Introduction(),
        Experience(),
        ProjectsView(),
        Education(),
        const ContactUsForm(),
      ],
    );
  }

  void showLoadingDialog() {
    if (!Get.isDialogOpen!) {
      Get.dialog(
        PopScope(
          canPop: false,
          child: AlertDialog(
            backgroundColor: bgColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text(
                  "Loading data, please wait...",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
