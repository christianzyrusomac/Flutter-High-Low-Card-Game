import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
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
    height: 350.0,
    width: 250.0,

    decoration: BoxDecoration(
    image: DecorationImage(
    fit: BoxFit.fill,
      image: AssetImage('assets/images/${widget.cardValue}${widget.cardLetter}.png')),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    );
  }
}
