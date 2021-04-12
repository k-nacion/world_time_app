import 'package:flutter/material.dart';
import 'file:///C:/Users/KennNacion/Desktop/Flutter%20Projects/world_time_app/lib/layout/ui/ChooseLocation.dart';

import 'layout/ui/Home.dart';
import 'layout/ui/Loading.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  var _primaryColor = 0xFF84A98C;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: MaterialColor(_primaryColor, {
        50: Color(0xFFF1F5F0),
        100: Color(0xFFDDE5DA),
        200: Color(0xFFC6D4C2),
        300: Color(0xFFAFC3A9),
        400: Color(0xFF9DB696),
        500: Color(_primaryColor),
        600: Color(0xFF84A27C),
        700: Color(0xFF799871),
        800: Color(0xFF6F8F67),
        900: Color(0xFF5C7E54),
      })),
      // initialRoute: '/home',
      routes: {
        "/": (context) => Loading(),
        '/home': (context) => Home(),
        '/chooseLocation': (context) => ChooseLocation(),
      },
    );
  }
}
