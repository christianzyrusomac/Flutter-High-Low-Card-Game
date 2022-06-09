
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

class mobileplay extends StatefulWidget {
  const mobileplay({Key? key}) : super(key: key);

  @override
  State<mobileplay> createState() => _mobileplay();
}

class _mobileplay extends State<mobileplay> {
  AudioPlayer player = AudioPlayer();
  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'CDHS';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  }
  int randomNumber(int min, int max){
    int random = min + Random().nextInt(max - min);
    return random;
  }
  int tries = 0;
  int score = 0;
  int randomValue = 0;
  var randomLetter = 'C';
  int card1 = 0;
  var letter1 = 'C';
  int card2 = 0;
  var letter2 = 'C';
  int card3 = 0;
  var letter3 = 'C';
  int card4 = 0;
  var letter4 = 'C';
  int card5 = 0;
  var letter5 = 'C';

  void random(){
    randomValue = randomNumber(1, 13);
    randomLetter = generateRandomString(1);
  }
  void firstOpenCard(){
    if(score == 0 && tries == 0) {
      card1 = randomNumber(1, 13);
      letter1 = generateRandomString(1);
    }
    else if(score == 0 && tries > 0){
      card1 = card1;
      letter1 = letter1;
    }
    if(tries > 1){
      tries =0;
    }
  }
  void restart(){
    card2 = 0;
    letter2 = 'C';
    card3 = 0;
    letter3 = 'C';
    card4 = 0;
    letter4 = 'C';
    card5 = 0;
    letter5 = 'C';
    score = 0;

    randomValue = 0;
    randomLetter = 'C';
  }
  void transferCard(){
    card5 = card4;
    card4 = card3;
    card3 = card2;
    card2 = card1;
    card1 = randomValue;

    letter5 = letter4;
    letter4 = letter3;
    letter3 = letter2;
    letter2 = letter1;
    letter1 = randomLetter;

    randomValue = 0;
    randomLetter = 'C';
  }
  void themeSong(String musics){
    AudioCache audioCache;
    audioCache = AudioCache(fixedPlayer: player);
    audioCache.loop(musics);
  }
  void soundEffects(String musics){
    AudioCache listenAudio;
    listenAudio = AudioCache(fixedPlayer: player);
    listenAudio.play(musics);
  }

  void stopAudio(){
    player.stop();
  }
  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:RoundedRectangleBorder(
              side: BorderSide(color: Colors.purpleAccent, width: 6.0,),
              borderRadius: BorderRadius.circular(20.0)) ,
          title: Text('Wow! Great Job'),
          content: Text("Proceed ?"),
          actions: <Widget>[
            FlatButton(
              child: Text("YES"),
              onPressed: () {
                setState(() {
                  transferCard();
                });
                Navigator.of(context).pop();
              },
            ),

          ],
        );
      },
    );
  }
  showAlertGAmeover(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:RoundedRectangleBorder(
              side: BorderSide(color: Colors.red, width: 6.0),
              borderRadius:
              BorderRadius.circular(20.0)) ,
          title: Text('Better Luck Next Time!!'),
          content: Text("Play again?"),
          actions: <Widget>[
            FlatButton(
              child: Text("YES"),
              onPressed: () {
                setState(() {
                  restart();
                });
                Navigator.of(context).pop();
              },
            ),

          ],
        );
      },
    );
  }
  void highOrEqual() {
    if (randomValue >= card1) {
      Future.delayed(Duration(milliseconds: 800), ()
      {
        score++;
        showAlert(context);
        soundEffects('check.mp3');
        stopAudio();

      });
    }
    else {
      Future.delayed(Duration(milliseconds: 800), ()
      {
        showAlertGAmeover(context);
        soundEffects('incorrect.mp3');
        stopAudio();
      });
    }
  }
  void lower() {
    if (randomValue < card1) {
      Future.delayed(Duration(milliseconds: 800), ()
      {
        score++;
        showAlert(context);
        soundEffects('check.mp3');
        stopAudio();
      });
    }
    else {
      Future.delayed(Duration(milliseconds: 800), ()
      {
        showAlertGAmeover(context);
        soundEffects('incorrect.mp3');
        stopAudio();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    firstOpenCard();
    themeSong("themesong.mp3");
    return Scaffold(
        body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset('assets/images/OMACDL3.jpg',
                      fit: BoxFit.cover,),
                  )
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50.0,),
                  Text('Score: $score',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 120.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Cards(
                          cardValue: card2,cardLetter: letter2
                      ),
                      Cards(
                          cardValue: card3,cardLetter: letter3
                      ),
                      Cards(
                          cardValue: card4,cardLetter: letter4
                      ),
                      Cards(
                          cardValue: card5,cardLetter: letter5
                      ),
                    ],
                  ),
                  SizedBox(height: 40.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Cards(
                        cardValue: card1,
                        cardLetter: letter1,
                      ),
                      SizedBox(width: 25.0,),
                      SizedBox(height: 50.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white,width: 6.0),
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.purpleAccent,
                            ),
                            child: FlatButton(
                              onPressed: (){
                                setState((){
                                  tries++;
                                  random();
                                  highOrEqual();
                                });
                              },
                              child: Text('=<',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'PlayMeGames-Demo',
                                ),),),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white,width: 6.0,),
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.purpleAccent,
                            ),
                            child: FlatButton(
                              onPressed: (){
                                setState((){
                                  tries++;
                                  random();
                                  lower();
                                });
                              },
                              child: Text('>',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'PlayMeGames-Demo',
                                ),),),
                          )
                        ],
                      ),
                      SizedBox(width: 30.0,),
                      Cards(
                        cardValue: randomValue,
                        cardLetter: randomLetter,
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        )
    );
  }
}
class  Cards extends StatefulWidget {

  final cardValue;
  final cardLetter;

  Cards({this.cardValue,this.cardLetter,});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 100.0,

      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/${widget.cardValue}${widget.cardLetter}.png')),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    );
  }
}
