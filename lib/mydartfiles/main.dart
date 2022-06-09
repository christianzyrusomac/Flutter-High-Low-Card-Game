
import 'package:christianflutter_dart/mydartfiles/ScreenAnimated.dart';
import 'package:flutter/material.dart';
import 'package:christianflutter_dart/mydartfiles/Homefunction.dart';

void main() => runApp( MaterialApp(
  debugShowCheckedModeBanner: false,
  home: ScreenAnimated(),
));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Playgame(),
    );
  }
}
