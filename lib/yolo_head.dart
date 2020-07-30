import 'package:flutter/material.dart';
 import 'package:yolobank/screens/content_screen.dart';
import 'package:yolobank/screens/splash_screen.dart';

class YoloHead extends StatelessWidget {



   @override
  Widget build(BuildContext context) {

     return MaterialApp(
      title: 'Yolo Bank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'TT Firs Neue',
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context)=> SplashScreen(),
        '/home':(context)=> ContentScreen()
      },

    );
  }
}