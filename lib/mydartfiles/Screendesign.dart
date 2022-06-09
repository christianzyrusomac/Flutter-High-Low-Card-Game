
import 'package:christianflutter_dart/mydartfiles/forhelp.dart';
import 'package:flutter/material.dart';
import 'Homefunction.dart';


class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.asset('assets/images/OMACDL3.jpg',
                fit: BoxFit.cover,)
            ),
            Container(height: 100,width: 100,),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('HighLow\nGame Card',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'pcsenior',
                    ),
                  ),
                  SizedBox(height: 40),
                  Image.asset('assets/images/OmacDL2.png',
                    scale: 1.5,
                  ),
                  SizedBox(height: 50),
                  RaisedButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Playgame())
                    );
                  },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.purpleAccent,
                    padding: EdgeInsets.all(25),
                    child: Text('Play',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20, bottom: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purpleAccent.withOpacity(0.5),
                          highlightColor: Colors.purpleAccent.withOpacity(0.5),
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => forHelp())
                            );
                          },

                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Text('Help?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.transparent,
                                border: Border.all(
                                    color: Colors.purpleAccent,
                                    width: 4
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
