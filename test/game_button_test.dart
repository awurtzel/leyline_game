import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:leyline_game/game_button.dart';

void main() {
  test('default values test', () {
    var gameButton = new GameButton();

    expect(gameButton.id, null);
    expect(gameButton.text, "");
    expect(gameButton.direction, ArrowDirections.UP);
    expect(gameButton.bg, Colors.grey);
    expect(gameButton.enabled, true);
  });
}