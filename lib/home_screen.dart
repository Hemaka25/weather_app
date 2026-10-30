import 'package:flutter/material.dart';

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
        child: Column(
          //use child one single widget inside aonther parent widget

          children: [
            //childern used to have multiple widgets
            Text(
              "Current Location", // create the children for display text
              style: TextStyle(
                fontSize: 14,
              ),
            ),

            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
