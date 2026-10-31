import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Controller to get the city name entered by the user
  final TextEditingController cityController =
      TextEditingController(); //cityController – the variable name we created.

  // Release the controller when the screen is closed
  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 98, 161, 199),

      // AppBar section
      appBar: AppBar(
        title: const Text("Search City"),
        backgroundColor: Color.fromARGB(255, 247, 253, 252),
      ),

      // Body section
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find Weather",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 20),

            // City search field
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: cityController,
                decoration: InputDecoration(
                  hintText: "Enter city name...",
                  border: InputBorder.none,
                  icon: Icon(Icons.location_city),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Search button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // taking the entered city name
                  String city = cityController.text.trim();

                  // Check  the field is empty or not(validation with snackbar)
                  if (city.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter a city name"),
                      ),
                    );
                  } else {
                    // Display the entered city in debug console
                    print("Searching for: $city");
                  }
                },
                child: Text("Search"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
