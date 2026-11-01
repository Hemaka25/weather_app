import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'weather_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    final currentDate =
        "${days[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}, ${now.year}";

    final currentTime = TimeOfDay.fromDateTime(now).format(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 149, 241,
            234), //create the app bar and set the background color.

        //create row widgets.
        title: Row(
          children: [
            Icon(
              Icons.cloud,
              color: Colors.white,
            ),

            SizedBox(width: 8), // keep spaces between items

            Text(
              "Weather",
              style: TextStyle(
                fontSize: 18, // add a text and change the font size.
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {
              //navigation part to search screen
              //Navigator.push() opens another screen.
              //backbutton is automatically appear with Navigator.push()
              Navigator.push(
                context,
                //MaterialPageRoute() define the new screen.
                MaterialPageRoute(
                  builder: (context) =>
                      const SearchScreen(), //SearchScreen() creates the new screen to display searching.
                ),
              );
            },
            icon: Icon(
              Icons.search, //add a search icon to appbar
            ),
          ),
          SizedBox(width: 5),
        ],
      ),

      //design the body section.

      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          //singleChildScrollView() use to scroll the screen perfectly.
          child: Column(
            //use child one single widget inside aonther parent widget
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //childern used to have multiple widgets
              Text(
                "Current Location", // create the children for display text
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 255, 250, 250),
                ),
              ),

              SizedBox(height: 5),

              FutureBuilder<Map<String, dynamic>>(
                future: WeatherService().getWeather('Colombo'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError || !snapshot.hasData) {
                    return Text(
                      "Unable to load weather",
                      style: TextStyle(color: Colors.white),
                    );
                  }

                  final weather = snapshot.data!;

                  final cityName = weather['name'];
                  final country = weather['sys']['country'];

                  final temperature =
                      (weather['main']['temp'] as num).toDouble();

                  final feelsLike =
                      (weather['main']['feels_like'] as num).toDouble();

                  final humidity = weather['main']['humidity'];

                  // Convert wind speed from m/s to km/h
                  final windSpeed =
                      (weather['wind']['speed'] as num).toDouble() * 3.6;

                  final condition = weather['weather'][0]['description'];

                  final weatherIcon = weather['weather'][0]['icon'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: const Color.fromARGB(
                                255, 255, 250, 250), //add location icon
                          ),
                          SizedBox(width: 5),
                          Text(
                            "$cityName, $country",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 255, 250, 250),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        "$currentDate  |  $currentTime",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 250, 250),
                        ),
                      ),

                      SizedBox(height: 12),

                      // creating main widget part (show weather details)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 139, 230, 232),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Current Weather", //using full layout as column and then use rows and columns seperately.
                            ),
                            SizedBox(height: 12),

                            Image.network(
                              'https://openweathermap.org/img/wn/${weatherIcon}@2x.png',
                              width: 100,
                              height: 100,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.cloud_queue, size: 70);
                              },
                            ),
                            SizedBox(height: 12),
                            Text(
                              "${temperature.toStringAsFixed(1)}°C",
                            ),
                            Text(
                              condition.toString().isNotEmpty
                                  ? condition.toString()[0].toUpperCase() +
                                      condition.toString().substring(1)
                                  : "Unknown",
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Feels like ${feelsLike.toStringAsFixed(1)}°C",
                            ),

                            //create the other weather details using cards

                            SizedBox(height: 20),

                            Row(
                              children: [
                                // for create humidity
                                Expanded(
                                  child: Container(
                                    //created container inside the row widget.all the cards inside that row widget.
                                    padding: EdgeInsets.all(
                                        18), //every card contains its own children under one child as column.

                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 236, 233, 233),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.water_drop,
                                        ),
                                        ////SizedBox(
                                        //height: 10,
                                        //),
                                        Text(
                                          "Humidity", //these are for create all widgets for humidity card
                                        ),
                                        SizedBox(
                                          //every card use expanded key word it uses to keep cards share the available horizontal space equally.
                                          height: 10,
                                        ),
                                        Text(
                                          "$humidity%",
                                        ),
                                        Text(
                                          "Air moisture",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(width: 15),

                                //for create wind speed card

                                Expanded(
                                  // next expanded
                                  child: Container(
                                    padding: EdgeInsets.all(18),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 244, 239, 239),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.air,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Wind speed",
                                        ),
                                        Text(
                                            "${windSpeed.toStringAsFixed(1)} km/h"),
                                        Text(
                                          "current wind",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            //create the hourly forcast section with cards

                            Text(
                              "Hourly Forecast",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),

                            SizedBox(height: 15),

                            //cards
                            SizedBox(
                              height: 140,
                              child: FutureBuilder<List<dynamic>>(
                                future: WeatherService().getForecast('Colombo'),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  if (snapshot.hasError || !snapshot.hasData) {
                                    return Center(
                                      child: Text("Unable to load forecast"),
                                    );
                                  }

                                  final forecastList = snapshot.data!;

                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 8,
                                    itemBuilder: (context, index) {
                                      final forecast = forecastList[index];

                                      final time =
                                          DateTime.parse(forecast['dt_txt']);

                                      final temperature =
                                          (forecast['main']['temp'] as num)
                                              .toDouble();

                                      final icon =
                                          forecast['weather'][0]['icon'];

                                      return Container(
                                        width: 90,
                                        margin: EdgeInsets.only(right: 12),
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              TimeOfDay.fromDateTime(time)
                                                  .format(context),
                                            ),
                                            Image.network(
                                              'https://openweathermap.org/img/wn/${icon}.png',
                                              width: 35,
                                              height: 35,
                                            ),
                                            Text(
                                              "${temperature.toStringAsFixed(1)}°C",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),

      backgroundColor: Color.fromARGB(255, 98, 161, 199),
    );
  }
}

//create seperate function for cards. all the design layout is created. then the function can called inside the body.
//all the cards can be created as equal because of the function.

Widget hourlyCard(String time, IconData icon, String temp) {
  return Container(
    width: 90,
    margin: EdgeInsets.only(right: 12),
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(time),
        Icon(icon, size: 30, color: Color.fromARGB(255, 31, 31, 30)),
        Text(
          temp,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ],
    ),
  );
}
