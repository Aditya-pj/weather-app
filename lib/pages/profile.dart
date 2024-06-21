import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

TextEditingController textcontrol1 = TextEditingController();
TextEditingController textcontrol2 = TextEditingController();
TextEditingController textcontrol3 = TextEditingController();

String name = "";
String email = "";
String homeCity = "";

void _saveinfo(String name,email,homeCity) async
{
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString('name', name);
  await pref.setString('email', email);
  await pref.setString('homeCity', homeCity);
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Details"),
        titleTextStyle: const TextStyle(color: Colors.yellow,
        fontSize: 30),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),

      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: textcontrol1,
              decoration: InputDecoration(
                hintText: "Name...",
            
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: textcontrol2,
              decoration: InputDecoration(
                hintText: "Email...",
            
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.email),
              ),
            ),
          ),
          Padding(
           
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
               style: TextStyle(color: Colors.white),
              controller: textcontrol3,
              decoration: InputDecoration(
                hintText: "Home City...",
            
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.location_city),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                name = textcontrol1.text;
                email = textcontrol2.text;
                homeCity = textcontrol3.text;
                _saveinfo(name,email,homeCity);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Data Saved !"),
                    duration: Duration(seconds: 15),
                  )

                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
              child: const Text("Submit",
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),
            ),
          ))
        ],
      )
    );
  }
}