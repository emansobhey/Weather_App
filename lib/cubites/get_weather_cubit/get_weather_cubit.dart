import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubites/get_weather_cubit/get_weather_states.dart';
import 'package:weather/model/weathermodel.dart';
import 'package:weather/servise/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(InitialState());
   weatherModel? weathermodel; // Corrected the type name to PascalCase

  getweather({required String cityName}) async {
    try {
      weathermodel = await WeatherService(Dio()).getcurrentWether(cityName: cityName);

      emit(LoadWeatherState(weathermodel!));
    } catch (e) {
      emit(WeatherFailStates(e.toString()));
    }
  }
}