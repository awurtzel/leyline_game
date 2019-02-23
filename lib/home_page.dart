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
    List<GameButton> buttonsList;
    var player1, player2, activePlayer;

    @override
    void initState() {
        super.initState();
        buttonsList = doInit();
        SystemChrome.setEnabledSystemUIOverlays([]);
    }

    List<GameButton> doInit() {
        player1 = new List();
        player2 = new List();
        activePlayer = 1;

        return <GameButton>[
            new GameButton(id: 1),
            new GameButton(id: 2),
            new GameButton(id: 3),
            new GameButton(id: 4),
            new GameButton(id: 5),
            new GameButton(id: 6),
            new GameButton(id: 7),
            new GameButton(id: 8),
            new GameButton(id: 9),
        ];
    }

    void playGame(GameButton button) {
        setState(() {
            if (activePlayer == 1) {
                button.text = 'X';
                button.bg = Colors.red;
                activePlayer = 2;
                player1.add(button.id);
            } else {
                button.text = 'O';
                button.bg = Colors.black;
                activePlayer = 1;
                player2.add(button.id);
            }

            button.enabled = false;
            int winner = checkWinner();
            if (winner == -1) {
                if (buttonsList.every((p) => p.text != "")) {
                    showDialog(
                        context: context,
                        builder: (_) =>
                        new CustomDialog(
                            "Game Tied",
                            "Press the reset button to start again.",
                            resetGame,
                        ),
                    );
                } else {
                    activePlayer == 2 ? autoPlay() : null;
                }
            }
        });
    }

    void autoPlay() {
        var emptyCells = new List();
        var list = new List.generate(9, (i) => i + 1);
        for (var cellID in list) {
            if (!(player1.contains(cellID) || player2.contains(cellID))) {
                emptyCells.add(cellID);
            }
        }

        var rand = new Random();
        var randIndex = rand.nextInt(emptyCells.length - 1);
        var cellID = emptyCells[randIndex];
        var buttonIndex = buttonsList.indexWhere((p) => p.id == cellID);
        playGame(buttonsList[buttonIndex]);
    }

    int checkWinner() {
        var winner = -1;
        if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
            winner = 1;
        }
        if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
            winner = 2;
        }

        if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
            winner = 1;
        }
        if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
            winner = 2;
        }

        if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
            winner = 1;
        }
        if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
            winner = 2;
        }

        if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
            winner = 1;
        }
        if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
            winner = 2;
        }

        if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
            winner = 1;
        }
        if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
            winner = 2;
        }

        if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
            winner = 1;
        }
        if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
            winner = 2;
        }

        if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
            winner = 1;
        }
        if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
            winner = 2;
        }

        if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
            winner = 1;
        }
        if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
            winner = 2;
        }

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
            } else {
                showDialog(
                    context: context,
                    builder: (_) =>
                    new CustomDialog(
                        "Player 2 Won",
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
            buttonsList = doInit();
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
                                crossAxisCount: 3,
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
                                        buttonsList[i].id.toString(),
                                        style: new TextStyle(
                                            color: Colors.white,
                                            fontSize: 60.0
                                        ),
                                    ),
                                    color: buttonsList[i].bg,
                                    disabledColor: buttonsList[i].bg,
                                ),
                            ),
                        ),
                    ),
                ],
            ),
        );
    }
}
