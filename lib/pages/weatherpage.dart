import 'dart:convert';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/pages/profile.dart';

class Weatherpage extends StatefulWidget {
  const Weatherpage({super.key});

  @override
  State<Weatherpage> createState() => _WeatherpageState();
}

class _WeatherpageState extends State<Weatherpage> {
  Future<dynamic> get_weather(String userCity) async {
    if (userCity == "") {
      userCity = "London";
    }
    try
    {
      var res = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$userCity&appid=ba8f332fd32543e8177503833df03adf'));
      if (res.statusCode == 200)
      {
        Map<String, dynamic> data = jsonDecode(res.body);
        return data;
      }
    
  else
      {
        throw Exception("Failed to receive data!");
      }
    }
  catch(e)
      {
        print("Error: $e");
      }
    

    
  }

  String userCity = "";

  IconData getIcon(String main)
  {
    switch (main.toLowerCase())
    {
      case 'rain':
      return Icons.beach_access;
      case 'clouds':
      return Icons.cloud;
      case 'clear':
      return Icons.wb_sunny;
      case 'snow':
      return Icons.ac_unit;
      case 'mist':
      case 'haze':
      return Icons.foggy;
      case 'thunderstorm':
      return Icons.thunderstorm;
      case 'drizzle':
      return Icons.wb_cloudy;
      default:
      return Icons.help_outline;
    }
  }

  String username = "User";
  TextEditingController textcontrol = TextEditingController();

 void _getinfo() async {
    SharedPreferences prefGet = await SharedPreferences.getInstance();
    setState(() {
      userCity = prefGet.getString('homeCity')!;
      username = prefGet.getString('name') ?? "User";
      get_weather(userCity);
    });
 }
  @override
  void initState() {
    super.initState();
    _getinfo();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Weather"),
        titleTextStyle: const TextStyle(color: Colors.yellow,
        fontSize: 30),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),

      ),
      body: FutureBuilder(
                future: get_weather(userCity),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("ERROR");
                  } else if (snapshot.hasData) {
                    Map<String,dynamic> data = snapshot.data;
                    dynamic main = data["weather"][0]["main"];
                    dynamic description = data["weather"][0]["description"];
                    dynamic temp = data["main"]["temp"]-273.15;
                    dynamic temp_min = data["main"]["temp_min"]-273.15;
                    dynamic temp_max = data["main"]["temp_max"]-273.15;
                    dynamic humidity = data["main"]["humidity"];
                    dynamic wind_speed = data["wind"]["speed"];
                    dynamic pressure = data["main"]["pressure"];
                    dynamic name = data["name"];
                    dynamic visibility = data["visibility"]/1000;
                   return Center(
                     child: Padding(
                       padding: EdgeInsets.all(12.0),
                       child: Expanded(
                         child: ListView(
                          padding: EdgeInsets.all(10),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("Hello, $username",
                                style: const TextStyle(color: Colors.white,
                                
                                fontSize: 30),
                                )
                                ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  controller: textcontrol,
                                  decoration: InputDecoration(
                                    hintText: "Enter city...",
                              
                                    hintStyle: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    prefixIcon: const Icon(Icons.search),
                                    suffixIcon: IconButton(onPressed: () {
                                      textcontrol.clear();
                                    }, icon: const Icon(Icons.clear),),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(onPressed: () {
                                  setState(() {
                                    userCity = textcontrol.text;
                                    print(userCity);
                                    get_weather(userCity);
                                    textcontrol.clear();
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  
                                  iconColor: Colors.yellow,
                                  backgroundColor: Colors.yellow,
                                ),
                                child: const Text("Search",
                                style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),),
                                ),
                              ),
                              Center(
                                child: Text(name.toString(),
                                style: const TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                                                            ),
                              ),
                              Icon(getIcon(main),
                              color: Colors.yellow,
                              size: 80,),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(main.toString(),
                                  style: const TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(description.toString(),
                                  style: const TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text("${temp.toStringAsFixed(2)}\u2103",
                                  style: const TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FloatingActionButton(onPressed: () {
                                  
                                  Navigator.pushNamed(context, '/detailedweather', arguments: {'name': name, 'temp': temp, 'temp_min': temp_min, 'temp_max': temp_max, 'humidity': humidity, 'wind_speed': wind_speed, 'pressure': pressure, 'visibility': visibility}
                                  );
                                },
                                backgroundColor: Colors.yellow,
                                shape: const CircleBorder(),
                                child: const Icon(Icons.arrow_forward_ios)
                                ),
                              ),
                              
                            ]
                          ),
                       )
                     ),
                   );
                  }
                  else
                  {
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(50.0),
                          child: Center(
                            child: Text("No data available for the city you entered",
                            style: TextStyle(color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                        ElevatedButton(onPressed: () {
                          setState( () {
                            userCity = "London";
                            get_weather(userCity);
                          }
                          );
                        },
                         child: const Text("Go Back",
                        style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),))
                      ],
                    );
                  }
                  
                  }
                )
               )
      
      ;
      }


   
}
