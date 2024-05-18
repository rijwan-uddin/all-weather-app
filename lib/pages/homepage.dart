import 'package:all_weather_app/provider/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageM extends StatelessWidget {
  static String routeName = '/';

  HomePageM({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        title: Text('Weather London'),
        backgroundColor: Colors.blue,
      ),
      body: Center(

        child: Consumer<weatherProv>(
          builder: (context, weatherProvider, _) {
            if (weatherProvider.weather == null) {
              return CircularProgressIndicator();
            } else {
              final weather = weatherProvider.weather;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${weather.name}',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Temperature',
                                style: TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                '${weather.main?.temp}°C',
                                style: TextStyle(fontSize: 22),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cloudiness',
                                style: TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                '${weather.clouds?.all}%',
                                style: TextStyle(fontSize: 22),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        '${weather.weather?.first.description}',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wind Speed: ${weather.wind?.speed} m/s',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Humidity: ${weather.main?.humidity}%',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Visibility: ${weather.visibility} meters',
                            style: TextStyle(fontSize: 18),
                          ),


                        ],

                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sunrise: ${_convertTimestampToTime(weather.sys?.sunrise as int?)}',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Sunset: ${_convertTimestampToTime(weather.sys?.sunset as int?)}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<weatherProv>(context, listen: false).fetchDataFromWeather('London');
        },
        child: Icon(Icons.cloud),
        backgroundColor: Colors.teal,
      ),
    );
  }

  String _convertTimestampToTime(int? timestamp) {
    if (timestamp == null) return '';
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return '${date.hour}:${date.minute}';
  }
}
