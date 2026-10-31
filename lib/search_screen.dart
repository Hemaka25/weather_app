import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 98, 161, 199),

      //create app bar
      appBar: AppBar(
        //backbutton is automatically appear with Navigator.push()
        title: Text("Search City"),
        backgroundColor: Colors.white,
      ),

      //body section
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find weather",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),

            // search filed
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Enter city name...",
                  border: InputBorder.none,
                  icon: Icon(Icons.location_city),
                ),
              ),

              //TextField – allows users to type a city name.
              //hintText – displays a text on search box.
              //InputBorder.none – removes the default underline.
            ),
          ],
        ),
      ),
    );
  }
}
