class weatherModel {
  final DateTime date;
  final String cityName;
  final double minTemp;
  final double maxTemp;
  final String? image;
  final double temp;
  final String states;

  weatherModel(
      {required this.date,
      required this.cityName,
      required this.minTemp,
      required this.maxTemp,
      required this.image,
      required this.temp,
      required this.states});

factory weatherModel.formJson(json){
  return weatherModel(date:DateTime.parse( json['current']['last_updated']),
    cityName: json['location']['name'],
    minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
    maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
    temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'], 
    states: json['forecast']['forecastday'][0]['day']['condition']['text'],
    image:  json['forecast']['forecastday'][0]['day']['condition']['icon'], );
}
}