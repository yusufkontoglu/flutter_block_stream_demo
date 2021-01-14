import 'dart:async';

import 'package:block_stream/service.dart';

class BlocTest{
  final listStreamController = StreamController.broadcast();

  //setting getter to our Stream controller
  Stream get getStream => listStreamController.stream;

  void changeList(int value){
    ListService.changeList(value);
    //refreshes event on change
    listStreamController.add(ListService.getList());
  }

  List getList(){
    listStreamController.add(ListService.getList());

    return ListService.getList();
  }
}

final blocTest = BlocTest();