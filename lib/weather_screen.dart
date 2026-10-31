import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // Sample weather data
  String city = "Kandy";
  double temperature = 28;
  String condition = "Partly Cloudy";
  int humidity = 75;
  double windSpeed = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 98, 161, 199),

      // AppBar section
      appBar: AppBar(
        title: const Text("Weather Details"),
        backgroundColor: const Color.fromARGB(255, 149, 241, 234),
      ),

      // Body section
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // City name
              Text(
                city,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              // Main weather card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 139, 230, 232),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.cloud_queue,
                      size: 70,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "$temperature°C",
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      condition,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Humidity and wind speed cards
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.water_drop),
                          const SizedBox(height: 10),
                          const Text("Humidity"),
                          Text(
                            "$humidity%",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.air),
                          const SizedBox(height: 10),
                          const Text("Wind Speed"),
                          Text(
                            "$windSpeed km/h",
                            style: const TextStyle(
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
