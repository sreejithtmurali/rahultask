import 'package:flutter/material.dart';
import '../services/weather_service.dart';
class WeatherReportScreen extends StatelessWidget {
  final WeatherService _weatherService = WeatherService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Report'),
      ),
      body: FutureBuilder(
        future: _weatherService.fetchWeatherReports(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            var weatherReports = snapshot.data;
            return ListView.builder(
              itemCount: weatherReports?.length??0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Weather Report $index'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
