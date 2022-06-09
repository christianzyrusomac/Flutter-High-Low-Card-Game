import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:christianflutter_dart/mydartfiles/desktopDisplay.dart';
import 'package:christianflutter_dart/mydartfiles/responsivelayout.dart';
import 'package:christianflutter_dart/mydartfiles/mobile.dart';



class Playgame extends StatefulWidget {
  const Playgame({Key? key}) : super(key: key);

  @override
  State<Playgame> createState() => _Playgame();
}

class _Playgame extends State<Playgame> {

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutResponse(
        mobileBody: mobileplay(),
      desktopBody: Desktopdisplay(),
      )
    );
  }
}