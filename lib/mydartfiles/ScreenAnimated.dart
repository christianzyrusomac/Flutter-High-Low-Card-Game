
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:christianflutter_dart/mydartfiles/Screendesign.dart';

class ScreenAnimated extends StatelessWidget {
  const ScreenAnimated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        child: Center(
          child: Column(
            children: [
              const Text('High-Low', style: TextStyle(fontSize: 50.0,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                  fontFamily: 'PlayMeGames-Demo',
                  letterSpacing: 7.0)),
              const Text('Game Card', style:
              TextStyle(fontSize: 35.0,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                  fontFamily: 'pcsenior',
                  letterSpacing: 7.0)),
              SizedBox(height: 50),
              Image.asset('assets/images/OmacDL2.png',
                scale: 1.5,),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black87,
      nextScreen: const Homepage(),
      splashIconSize: 300,
      duration: 3000,
      animationDuration: const Duration(seconds: 5),
    );

  }
}
