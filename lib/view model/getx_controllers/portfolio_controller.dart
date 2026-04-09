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
import 'dart:async'; // Add this

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

  Future<void> loadPortfolioData() async {
    isLoading.value = true;
    bool dialogShown = false;

    Timer? dialogTimer;

    // Show dialog after 3 seconds (only if still loading)
    // dialogTimer = Timer(const Duration(seconds: 3), () {
    //   if (isLoading.value && !(Get.isDialogOpen ?? false)) {
    //     showLoadingDialog();
    //     dialogShown = true;
    //   }
    // });

    try {
      final result = await Future.any([
        // 🔹 API call
        _apiService.fetchPortfolioData(useLocal: false),

        // 🔹 Fallback after 3 seconds
        Future.delayed(const Duration(seconds: 3), () async {
          log("⏳ API timeout → loading local data");
          return await _apiService.fetchPortfolioData(useLocal: true);
        }),
      ]);

      portfolioData.value = result;
      log("✅ Portfolio data loaded: ${result.toJson()}");
    } catch (e) {
      log("❌ Error → fallback to local data");

      // Final fallback (in case API fails before 3 sec)
      final localResult = await _apiService.fetchPortfolioData(useLocal: true);
      portfolioData.value = localResult;
    } finally {
      isLoading.value = false;

      // dialogTimer.cancel();

      // if (dialogShown && (Get.isDialogOpen ?? false)) {
      //   Get.back();
      // }
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
                      // If no data yet, show loading dialog
                      if (portfolioData.value?.intro?.firstName?.isEmpty ??
                          true) {
                        showLoadingDialog();
                        // Get.back();
                      }

                      // Load the data and wait for it to finish
                      await loadPortfolioData();

                      // Close dialog if it's still open
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

  RxList<bool> hovers = <bool>[].obs;
  onHover(int index, bool value) {
    hovers[index] = value;
  }
}
