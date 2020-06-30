import 'package:flutter/material.dart';
import 'package:travelling/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travelling',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
     home: LAndingPage(),
    );
  }
}


