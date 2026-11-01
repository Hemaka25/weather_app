import 'package:flutter/material.dart';
import 'weather_service.dart';

class WeatherScreen extends StatefulWidget {
  final String city;

  const WeatherScreen({
    super.key,
    required this.city,
  });

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // Weather variables
  double temperature = 0;
  String condition = "";
  int humidity = 0;
  double windSpeed = 0;
  String weatherIcon = "";

  //errors

  bool isLoading = true;
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  // Get weather information from API
  Future<void> getWeatherData() async {
    try {
      final data = await WeatherService().getWeather(widget.city);

      setState(() {
        temperature = (data['main']['temp'] as num).toDouble();
        condition = data['weather'][0]['description'];
        humidity = data['main']['humidity'];
        windSpeed = (data['wind']['speed'] as num).toDouble();
        weatherIcon = data['weather'][0]['icon'];

        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Unable to get weather data";
        isLoading = false;
      });

      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 98, 161, 199),
      appBar: AppBar(
        title: const Text("Weather Details"),
        backgroundColor: Color.fromARGB(255, 149, 241, 234),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : errorMessage.isNotEmpty
                ? Center(
                    child: Text(
                      errorMessage,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // City name
                        Text(
                          widget.city,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 20),

                        // Main weather card
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 139, 230, 232),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            children: [
                              Image.network(
                                'https://openweathermap.org/img/wn/$weatherIcon@2x.png',
                                width: 100,
                                height: 100,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.cloud_queue,
                                    size: 70,
                                  );
                                },
                              ),
                              SizedBox(height: 15),
                              Text(
                                "${temperature.toStringAsFixed(1)}°C",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                condition,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20),

                        // Humidity and wind speed
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Icon(Icons.water_drop),
                                    SizedBox(height: 10),
                                    Text("Humidity"),
                                    Text(
                                      "$humidity%",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Icon(Icons.air),
                                    SizedBox(height: 10),
                                    Text("Wind Speed"),
                                    Text(
                                      "${windSpeed.toStringAsFixed(1)} m/s",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
