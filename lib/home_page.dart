import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leyline_game/custom_dialog.dart';
import 'package:leyline_game/game_board.dart';
import 'package:leyline_game/game_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const int GLOBAL_DEFAULT_SIZE = 3;
  GameBoard gameBoard;

  @override
  void initState() {
    super.initState();
    gameBoard = doInit(GLOBAL_DEFAULT_SIZE);
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  GameBoard doInit(int size) {
    return new GameBoard(size);
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
      gameBoard = doInit(GLOBAL_DEFAULT_SIZE);
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
                crossAxisCount: GLOBAL_DEFAULT_SIZE,
                childAspectRatio: 1.0,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0,
              ),
              itemCount: gameBoard.length(),
              itemBuilder: (context, i) =>
              new SizedBox(
                width: 100.0,
                height: 100.0,
                child: new RaisedButton(
                  padding: const EdgeInsets.all(1.0),
                  onPressed: gameBoard.at(i).enabled ?
                    () => playGame(gameBoard.at(i)) : null,
                  child: new Text(
                    gameBoard.at(i).text,
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 50.0
                    ),
                  ),
                  color: gameBoard.at(i).bgColor,
                  disabledColor: gameBoard.at(i).bgColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
