import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yolobank/helper/screen_utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void didChangeDependencies(){
    ScreenUtils.setScreenSizes(context);
  
    super.didChangeDependencies();
    delayer();
  }
  void delayer(){
   Timer(Duration(seconds: 1), () =>
       Navigator.pushReplacementNamed(context, '/home')
   );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
