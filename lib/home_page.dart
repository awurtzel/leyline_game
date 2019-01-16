import 'package:flutter/material.dart';
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
        });
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text("Leyline"),
            ),
            body: new GridView.builder(
                padding: const EdgeInsets.all(10.0),
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
                        padding: const EdgeInsets.all(8.0),
                        onPressed: buttonsList[i].enabled ?
                            () => playGame(buttonsList[i]) : null,
                        child: new Text(buttonsList[i].text,
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0
                            ),
                        ),
                        color: buttonsList[i].bg,
                        disabledColor: buttonsList[i].bg,
                    ),
                ),
            ),
        );
    }
}
