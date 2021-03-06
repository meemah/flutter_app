import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/detail_screen.dart';

import 'package:flutterapp/Screens/home_screen.dart';
import 'package:flutterapp/Screens/payment_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeScreen.route,
      routes: {
         HomeScreen.route: (context) => HomeScreen(),
        DetailScreen.route: (context)=>DetailScreen(),
        PaymentScreen.route: (context)=>PaymentScreen()
      },
      // home: PaymentScreen(),
      
      // HomeScreen(),
    );
  }
}

