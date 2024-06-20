import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/pages/detailed_weather.dart';
import 'package:myapp/pages/profile.dart';
import 'package:myapp/pages/weatherpage.dart';

class RouteGenerator
{
  static Route<dynamic> generateRoute(RouteSettings settings)
  {
    final args = settings.arguments as Map<String,dynamic>;
    switch(settings.name)
    {
      
      case '/':
      case '/weatherpage':
      return MaterialPageRoute(builder: (_) => const MyApp());
      case '/profile':
      return MaterialPageRoute(builder: (_) => const Profile());
      case '/detailedweather':
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2657948861.
      if (args is Map<String,dynamic>)
      {
      return MaterialPageRoute(builder: (_) => DetailedWeather(name: args['name'],temp: args['temp'],temp_min: args['temp_min'],temp_max: args['temp_max'],humidity: args['humidity'],wind_speed: args['wind_speed'],pressure: args['pressure'],visibility: args['visibility'], ));
      }
      return MaterialPageRoute(builder: (_) => const Error());
      default:
      return MaterialPageRoute(builder: (_) => const Error());
    }
  }
  }


  class Error extends StatelessWidget
  {
    const Error({super.key});


    @override
    Widget build(BuildContext context)
    {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    }
  }

