import 'package:flutter/material.dart';
import '../pages/weather_api.dart';

class DashboardScreen extends StatelessWidget {
  final String location = 'San Francisco';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: FutureBuilder(
        future: WeatherService.getWeather(location),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            final weather = snapshot.data as Map<String, dynamic>;
            return Column(
              children: [
                Text('Location: $location'),
                Text('Temperature: ${weather['main']['temp']}°C'),
                Text('Weather: ${weather['weather'][0]['description']}'),
              ],
            );
          }

          return Text('Unable to retrieve weather data.');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.refresh),
      ),
    );
  }
}
