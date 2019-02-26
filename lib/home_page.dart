import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leyline_game/custom_dialog.dart';
import 'package:leyline_game/game_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const int n = 4;
  List<GameButton> buttonsList;
  List<int> pathList;

  @override
  void initState() {
    super.initState();
    buttonsList = doInit(n);
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  List<GameButton> doInit(int sqrt) {
    pathList = new List.generate(pow(sqrt, 2), (i) => i + 1);
    do {
      pathList.shuffle();
    } while (!isValidPath(pathList));

    return new List.generate(pow(sqrt, 2), (i) => new GameButton(id: i));
  }

  bool isValidPath(List<int> path) {
    bool isValid = true;

    return isValid;
  }

  void playGame(GameButton button) {
    setState(() {
      button.text = 'X';
      button.bgColor = Colors.red;
    });
  }

  int checkWinner() {
    var winner = -1;

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
          context: context,
          builder: (_) =>
          new CustomDialog(
            "Player 1 Won",
            "Press the reset button to start again.",
            resetGame,
          )
        );
      }
    }
    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }

    setState(() {
      buttonsList = doInit(n);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Expanded(
            child: new GridView.builder(
              padding: const EdgeInsets.fromLTRB(
                250, 20, 250, 20),
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: n,
                childAspectRatio: 1.0,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0,
              ),
              itemCount: buttonsList.length,
              itemBuilder: (context, i) =>
              new SizedBox(
                width: 100.0,
                height: 100.0,
                child: new RaisedButton(
                  padding: const EdgeInsets.all(1.0),
                  onPressed: buttonsList[i].enabled ?
                    () => playGame(buttonsList[i]) : null,
                  child: new Text(
                    pathList[i].toString(),
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 50.0
                    ),
                  ),
                  color: buttonsList[i].bgColor,
                  disabledColor: buttonsList[i].bgColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
