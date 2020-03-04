import 'package:flutter/material.dart';
import 'package:leyline_game/game_button.dart';
import 'package:test/test.dart';

void main() {
  test('Default values of GameButton are correct', () {
    var gameButton = new GameButton();

    expect(gameButton.id, isNull);
    expect(gameButton.text, isEmpty);
    expect(gameButton.direction, ArrowDirection.UP);
    expect(gameButton.bgColor, Colors.grey);
    expect(gameButton.enabled, isTrue);
  });
}
