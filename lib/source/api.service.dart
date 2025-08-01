import 'package:dio/dio.dart';
import 'package:portfolio/helper/dialog_helper.dart';
import 'package:portfolio/model/portfolio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl:
          'https://kojusagar.com.np/api/portfolio', // Replace with your actual base URL
      connectTimeout: Duration(seconds: 3000),
      receiveTimeout: Duration(seconds: 15),
    ),
  );

  Future<PortfolioModel> fetchPortfolioData() async {
    try {
      final response = await _dio.get('/get-portfolio-data');
      if (response.statusCode == 200) {
        return PortfolioModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      print('Dio error: ${e.message}');
      throw Exception('Dio error: ${e.message}');
    }
  }

  Future<bool> sendFeedback({
    required String name,
    required String contactNumber,
    required String email,
    required String feedback,
  }) async {
    final data = {
      "name": name,
      "contactNumber": contactNumber,
      "email": email,
      "feedback": feedback,
    };

    try {
      final response = await _dio.post(
        '/send-feedback',
        data: data,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        AlertHelper.showFlushBar(message: response.data["message"]);
        return true;
      } else {
        AlertHelper.showFlushBar(
          message: response.data["message"],
          error: true,
        );
        return false;
      }
    } on DioException catch (e) {
      AlertHelper.showFlushBar(message: e.toString(), error: true);
      return false;
    }
  }
}
