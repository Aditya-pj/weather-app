import 'package:flutter/material.dart';

class DetailedWeather extends StatelessWidget {
  final String name;
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3602156718.
  final String temp_min;
  final String temp_max;
  final String humidity;
  final String wind_speed;
  final String pressure;
  final String visibility;
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3773456992.
  
  final String temp;
  const DetailedWeather({super.key, required this.name, required this.temp_min, required this.temp_max, required this.humidity, required this.wind_speed, required this.pressure, required this.visibility, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Weather"),
        titleTextStyle: const TextStyle(color: Colors.yellow,
        fontSize: 30),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),

      ),

                    
        body: Center(
                     child: Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Expanded(
                         child: ListView(
                          padding: EdgeInsets.all(10),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Minimum temperature: ${temp_min}\u2103",
                                style: const TextStyle(color: Colors.white,
                               
                                fontSize: 14),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Maximum temperature: ${temp_max}\u2103",
                                style: const TextStyle(color: Colors.white,
                         
                                fontSize: 14),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Humidity: ${humidity.toString()} %",
                                style: const TextStyle(color: Colors.white,
                        
                                fontSize: 14),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Wind Speed: ${wind_speed.toString()} km/h",
                                style: const TextStyle(color: Colors.white,
                    
                                fontSize: 14),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Pressure: ${pressure.toString()} mb",
                                style: const TextStyle(color: Colors.white,
                     
                                fontSize: 14),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("visibility: ${visibility.toString()} km",
                                style: const TextStyle(color: Colors.white,
                          
                                fontSize: 14),),
                              )
                            ]
                          ),
                       )
                     ),
                   )
                  
                  
                      
                  
                 );
                 
  }
}

//
//
      