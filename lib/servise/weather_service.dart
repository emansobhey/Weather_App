
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather/model/weathermodel.dart';

class WeatherService {
  final Dio dio;
  final String apiKey = 'd9f11863e8c2467baa3113127240302';
  final String baseUrl = 'http://api.weatherapi.com/v1';
  WeatherService(this.dio);
  Future<weatherModel> getcurrentWether({required String cityName}) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');

      weatherModel weathermodel = weatherModel.formJson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'OOPS THERE WAS AN ERROR , TRY LATER';
      throw Expando(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('OOPS THERE WAS AN ERROR , TRY LATER');
    }
  }
}
