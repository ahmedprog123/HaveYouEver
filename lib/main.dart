import 'package:flutter/material.dart';
import 'package:have_u_ever/HomeScreen.dart';

import 'LoserScreen.dart';
import 'WonScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Have You Ever',
      home: HomeScreen(),
    );
  }
}
