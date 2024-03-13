import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubites/get_weather_cubit/get_weather_cubit.dart';

class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('search city'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getweatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getweatherCubit.getweather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              labelText: 'search',
              suffixIcon: const Icon(Icons.search),
              hintText: 'Enter City Name',
              hintStyle: const TextStyle(color: Colors.black45),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
