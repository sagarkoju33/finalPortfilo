import 'package:dio/dio.dart';
import 'package:portfolio/domain/portfolio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl:
          'https://kojusagar.com.np/api/portfolio', // Replace with your actual base URL
      connectTimeout: Duration(seconds: 10),
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
}
