import 'dart:developer';

import 'package:get/get.dart';
import 'package:portfolio/domain/portfolio.dart';
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
}
