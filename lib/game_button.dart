import 'package:flutter/material.dart';

enum ArrowDirection {
    UP,
    UP_RIGHT,
    RIGHT,
    DOWN_RIGHT,
    DOWN,
    DOWN_LEFT,
    LEFT,
    UP_LEFT,
}

class GameButton {
    final id;
    String text;
    ArrowDirection direction;
    Color bg;
    bool enabled;

    GameButton({
        this.id,
        this.text = "",
        this.direction = ArrowDirection.UP,
        this.bg = Colors.grey,
        this.enabled = true,
    });
}