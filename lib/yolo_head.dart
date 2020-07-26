import 'package:flutter/material.dart';
import 'package:yolobank/screens/content_screen.dart';

class YoloHead extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yolo Bank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context)=> ContentScreen(),
      },

    );
  }
}