import 'package:flutter/material.dart';
import 'package:yolobank/bloc/content_bloc.dart';
import 'package:yolobank/helper/enums.dart';
import 'package:yolobank/screens/chart_screen.dart';
import 'package:yolobank/screens/home_screen.dart';

class ContentScreen extends StatelessWidget {

  final ContentBloc _contentBloc = ContentBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavWidget(),
      body: StreamBuilder<BottomNav>(
        initialData: BottomNav.HOME,
        stream: _contentBloc.pageStream,
        builder: (context, snapshot) {
          switch(snapshot.data){
            case BottomNav.HOME:
              return HomeScreen();
            case BottomNav.CHART:
              return ChartScreen();
            default:
              return Container();
          }
        }
      ),
    );
  }

  Widget _bottomNavWidget(){
    return StreamBuilder<int>(
      stream: _contentBloc.bottomNavStream,
      initialData: 0,
      builder: (context, snapshot) {
        return BottomNavigationBar(
          currentIndex: snapshot.data,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: (index) => _contentBloc.bottomNavSink.add(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart),
              title: Text("Charts"),
            )
          ],
        );
      }
    );
  }
}
