import 'package:flutter/material.dart';

import 'bloc.dart';
import 'service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Dropper(),
            ListViewer(),
          ],
        ),
      ),
    );
  }
}

//region Drop down menu for selecting 1 or 2
int val = 1;

var itemList = [
  DropdownMenuItem(value: 0, child: Text('1')),
  DropdownMenuItem(value: 1, child: Text('2')),
];

class Dropper extends StatefulWidget {
  @override
  _DropperState createState() => _DropperState();
}

class _DropperState extends State<Dropper> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: itemList,
      value: val,
      onChanged: (value) {
        // only refreshes this widget
        setState(() {
          val = value;
        });
        blocTest.changeList(value);
      },
    );
  }
}
//endregion

//region Stream that refreshes value on change
class ListViewer extends StatefulWidget {
  @override
  _ListViewerState createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: blocTest.getList(),
      stream: blocTest.getStream,
      builder: (context,snapshot){
        return Text(snapshot.data[0].toString());
      },
    );
  }
}
//endregion

