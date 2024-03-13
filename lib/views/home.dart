import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/category/noweter.dart';
import 'package:weather/category/weather.dart';
import 'package:weather/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubites/get_weather_cubit/get_weather_states.dart';
import 'package:weather/model/weathermodel.dart';
import 'package:weather/views/search.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weater App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const search();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, State) {
          if (State is InitialState) {
            return NoWeaterbody();
          } else if (State is LoadWeatherState) {
            return upweather(
              weather: State.weathermodel,
            );
          } else {
            return Text('opps ther are error');
          }
        },
      ),
    );
  }
}
