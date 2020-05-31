import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          title: Center(child: Text('Dynamic Dice')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = Random().nextInt(6) + 1;
  int rightDiceNumber = Random().nextInt(6) + 1;
  dynamic numberRolled = "";
  dynamic add = 12;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      add = leftDiceNumber + rightDiceNumber;
      numberRolled = "You rolled a $add";
    });
  }

  Widget _getIcon() {
    if (add >= 9)
      return Column(
        children: <Widget>[
          Icon(
            Icons.tag_faces,
            color: Colors.white,
            size: 50.0,
          ),
          Text(
            'Great!!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ],
      );
    else if (add > 4)
      return Column(
        children: <Widget>[
          Icon(
            Icons.face,
            color: Colors.white,
            size: 50.0,
          ),
          Text(
            'Not Bad!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ],
      );
    else if (add <= 4)
      return Column(
        children: <Widget>[
          Icon(
            Icons.thumb_down,
            color: Colors.white,
            size: 50.0,
          ),
          Text(
            'You\'re Joking Right?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ],
      );
    else
      return Icon(Icons.tag_faces);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  '$numberRolled',
                  style: TextStyle(
                    fontSize: 60.0,
                    color: Colors.white,
                  ),
                ),
              ),
              _getIcon(),
            ],
          ),
        ),
        Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'images/dice$leftDiceNumber.png',
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'images/dice$rightDiceNumber.png',
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(18.0),
              color: Colors.amberAccent,
              child: Text(
                "Roll Dice!!",
                style: TextStyle(fontSize: 20.0),
              ),
              splashColor: Colors.white,
              onPressed: () {
                rollDice();
              },
            ),
          ],
        ),
      ],
    );
  }
}
