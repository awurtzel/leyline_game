import 'package:flutter/material.dart';

enum ArrowDirections {
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
    ArrowDirections direction;
    Color bg;
    bool enabled;

    GameButton({
        this.id,
        this.text = "",
        this.direction = ArrowDirections.UP,
        this.bg = Colors.grey,
        this.enabled = true,
    });
}