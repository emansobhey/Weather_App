import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/main.dart';
import 'package:weather/model/weathermodel.dart';

class upweather extends StatelessWidget {
  const upweather({
    Key? key,
    required this.weather,
  }) : super(key: key);
  final weatherModel weather;

  @override
  Widget build(BuildContext context) {
    var weathermodel = BlocProvider.of<GetWeatherCubit>(context).weathermodel;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          getThemeColor(weather.states)[500]!,
          getThemeColor(weather.states)[50]!,
          getThemeColor(weather.states),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    ),
    child:
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(weather.cityName,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        Text(
          'Updated at: ${weather.date.hour}:${weather.date.minute}',
          style: const TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network('http:${weather.image!}'),
            Text(
              weather.temp.toString(),
              style: const TextStyle(
                  fontSize: 28,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
            Column(children: [
              Text(
                'Maxtemp: ${weather.maxTemp.round()}',
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              Text(
                'Mintemp : ${weather.minTemp.round()}',
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              const SizedBox(
                height: 30,
              ),
            ]),
          ],
        ),
        const SizedBox(
          width: 100,
        ),
        Text(
          weather.states,
          style: const TextStyle(
              fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    ));
  }
}
