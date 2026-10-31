import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 98, 161, 199),

        //create app bar
        appBar: AppBar(
          title: Text("Search City"),
          backgroundColor: Colors.white,
        ),

        //body section
        body: Padding(
            padding: EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Find weather",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ])));
  }
}
