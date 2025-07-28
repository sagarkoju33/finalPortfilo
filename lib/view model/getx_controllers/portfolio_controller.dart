import 'dart:developer';

import 'package:get/get.dart';
import 'package:portfolio/helper/dialog_helper.dart';
import 'package:portfolio/model/portfolio.dart';
import 'package:portfolio/source/api.service.dart';

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
    try {
      isLoading.value = true;
      final result = await _apiService.fetchPortfolioData();
      isLoading.value = false;
      log("Portfolio data fetched successfully===========>${result.toJson()}");
      portfolioData.value = result;
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading.value = false;
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
}
