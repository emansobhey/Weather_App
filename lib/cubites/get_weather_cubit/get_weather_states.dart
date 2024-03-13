import 'package:weather/model/weathermodel.dart';

class WeatherStates {}

class LoadWeatherState extends WeatherStates {
  final weatherModel weathermodel;
  LoadWeatherState(this.weathermodel);
}

class InitialState extends WeatherStates {}

class WeatherFailStates extends WeatherStates {
  final String massge;

  WeatherFailStates( this.massge);
}
