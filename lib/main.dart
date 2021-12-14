import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(key: null,));
}

class MyApp extends StatelessWidget {
  const MyApp({required Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Container(color: Colors.red,),
    );
  }
}

