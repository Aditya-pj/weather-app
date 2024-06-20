import 'package:flutter/material.dart';
import 'package:myapp/pages/profile.dart';

import 'package:myapp/pages/route.dart';
import 'package:myapp/pages/weatherpage.dart';


void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  List<Widget> pages = [
    const Weatherpage(),
    const Profile(),
  ];
  int _index = 0;
  void _changeindex(int index) {
    setState(() {
      _index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 1, 1, 20),
        
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      home: Scaffold(
            body: pages[_index],
            bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.sunny,
                     
            ), label: "Weather",
            
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person,
            ), label: "Profile",
            ),
            ],
            currentIndex: _index,
            onTap: _changeindex,
            selectedFontSize: 20,
            unselectedFontSize: 18,
            selectedItemColor: Colors.yellow,
            unselectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: true,)
                    
            ),
          
      
    );
  }
}