import 'dart:async';

import 'package:block_stream/service.dart';

class BlocTest{
  final listStreamContoller = StreamController.broadcast();

  Stream get getStream => listStreamContoller.stream;

  void changeList(int value){
    ListService.changeList(value);

    listStreamContoller.add(ListService.getList());
  }

  List getList(){
    listStreamContoller.add(ListService.getList());

    return ListService.getList();
  }
}

final blocTest = BlocTest();