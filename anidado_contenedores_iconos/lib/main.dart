import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.star),
                  Container(
                    child: Text("Text inside Container 2"),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.favorite),
                  Container(
                    child: Text("Text inside Container 3"),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.thumb_up),
                  Container(
                    child: Text("Text inside Container 4"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
