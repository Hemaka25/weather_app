import 'package:flutter/material.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: const Color.fromARGB(
                        255, 255, 250, 250), //add location icon
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Colombo Sri Lanka",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 250, 250),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                "Monday,November 1, 2026",
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
                    Icon(
                      Icons.cloud_queue,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "28 C",
                    ),
                    Text(
                      "Partialy Cloudy",
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Feels like 30 c",
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
                              color: const Color.fromARGB(255, 236, 233, 233),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  "75%",
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                Text("12 km/h"),
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
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          hourlyCard("Now", Icons.wb_sunny, "28°C"),
                          hourlyCard("12 PM", Icons.cloud, "30°C"),
                          hourlyCard("1 PM", Icons.cloud, "29°C"),
                          hourlyCard("2 PM", Icons.grain, "27°C"),
                          hourlyCard("3 PM", Icons.wb_cloudy, "26°C"),
                        ],
                      ),
                    ),
                  ],
                ),
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
