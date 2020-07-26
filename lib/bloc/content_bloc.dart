import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:yolobank/helper/enums.dart';

class ContentBloc {

  PublishSubject<int> _bottomNavSubject =  PublishSubject<int>();
  Stream<int> get bottomNavStream => _bottomNavSubject.stream;
  StreamController<int> _bottomNavController = StreamController<int>();
  Sink<int> get bottomNavSink => _bottomNavController.sink;

  PublishSubject<BottomNav> _pageSubject =  PublishSubject<BottomNav>();
  Stream<BottomNav> get pageStream => _pageSubject.stream;

  ContentBloc(){
    _bottomNavController.stream.listen((event) {
      _bottomNavSubject.add(event);
      _pageSubject.add(BottomNav.values.firstWhere((element) => element.index == event));
    });
  }

  void dispose() {
    _bottomNavSubject.close();
    _bottomNavController.close();
    _pageSubject.close();
  }

}