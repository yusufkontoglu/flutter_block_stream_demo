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

int val = 1;

var itemList = [
  DropdownMenuItem(value: 0, child: Text('1')),
  DropdownMenuItem(value: 1, child: Text('2')),
];

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton(
                  items: itemList,
                  value: val,
                  onChanged: (value) {
                    setState(() {
                      val = value;
                    });
                    blocTest.changeList(value);
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StreamBuilder(
                  initialData: blocTest.getList(),
                  stream: blocTest.getStream,
                  builder: (context,snapshot){
                    return Text(snapshot.data[0].toString());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
