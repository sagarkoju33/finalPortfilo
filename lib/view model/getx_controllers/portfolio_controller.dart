import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:portfolio/helper/dialog_helper.dart';
import 'package:portfolio/model/portfolio.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/source/api.service.dart';

import '../../utils/web_reload_web.dart';

class PortfolioController extends GetxController {
  var portfolioData =
      Rxn<PortfolioModel>(); // Use Rxn<T> for nullable reactive variables
  var isLoading = false.obs;
  var crossAxisCount = 3.obs; // Default ratio for child widgets
  var childRatio = 2.0.obs; // Default ratio for child widgets
  final _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    loadPortfolioData();
  }

  void loadPortfolioData() async {
    isLoading.value = true;

    // Track if the dialog was shown
    bool dialogShown = false;

    // Start a delayed task to show loading dialog only if API takes > 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (isLoading.value) {
        showLoadingDialog();
        dialogShown = true;
      }
    });

    try {
      final result = await _apiService.fetchPortfolioData().timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception("Connection timed out");
        },
      );
      portfolioData.value = result;
      log("Portfolio data fetched successfully===========>${result.toJson()}");
    } finally {
      isLoading.value = false;
      if (dialogShown && (Get.isDialogOpen ?? false)) {
        Get.back();
      }
    }
  }

  Future<bool> submitFeedbackForm({
    required String name,
    required String contactNumber,
    required String email,
    required String feedback,
  }) async {
    try {
      AlertHelper.waitWidget();
      final result = await _apiService.sendFeedback(
        name: name,
        contactNumber: contactNumber,
        email: email,
        feedback: feedback,
      );
      AlertHelper.closeWaitWidget();
      return result;
    } catch (e) {
      log("Feedback submission failed: $e");
      rethrow; // Let the UI handle the exception
    }
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
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text(
                  "Loading data, please wait...",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (kIsWeb) {
                      reloadPage();
                    } else {
                      // Show dialog first if data is not yet loaded or still loading
                      if (portfolioData.value?.intro?.firstName?.isEmpty ??
                          true) {
                        showLoadingDialog();
                      }

                      // Load data
                      loadPortfolioData();

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
      );
    }
  }
}
