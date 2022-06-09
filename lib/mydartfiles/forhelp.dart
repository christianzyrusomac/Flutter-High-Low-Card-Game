import 'package:flutter/material.dart';

class forHelp extends StatefulWidget {
  const forHelp({Key? key}) : super(key: key);

  @override
  State<forHelp> createState() => _forHelpState();
}

class _forHelpState extends State<forHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 150,),
          Center(
            child: Container(
              padding: EdgeInsets.all(100.0),
              child: Text('Directions:\n1. Press the Play button.\n2. Guess the next card if its =< or >\n3. Press yes if you want to continue or play again.',
              style: TextStyle(
                fontSize: 25,
              ),),
              color: Colors.purple[100],
            ),
          ),
        ],
      ),
    );
  }
}
