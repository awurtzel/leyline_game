import 'dart:math';

import 'package:leyline_game/game_button.dart';

class GameBoard {
  static const int MAXIMUM_SEED_TRIALS = 10000;
  int boardSize;
  List<GameButton> buttonsList;
  List<int> pathList;

  GameBoard(int size) {
    boardSize = size;
    buttonsList = new List.generate(pow(size, 2), (i) => new GameButton(id: i));
    pathList = new List.generate(pow(size, 2), (i) => i + 1);

    int trialNumber = 0;
    do {
      pathList.shuffle();
      trialNumber++;
    } while (!isValidPath() && trialNumber <= MAXIMUM_SEED_TRIALS);
  }

  void seed(List<int> seedList) {
    pathList = seedList;
  }

  bool isValidPath() {
    bool isValid = true;

    pathList.forEach((i) => (isValid &= isInLOS(i, i + 1)));

    return isValid;
  }

  bool isInLOS(int origin, int destination) {
    bool los = false;

    los = inSameRow(origin, destination)
      || inSameColumn(origin, destination);
      //|| inSameForwardDiag(origin, destination)
      //|| inSameBackwardDiag(origin, destination);

    return los;
  }

  int length() {
    return buttonsList.length;
  }

  GameButton at(int index) {
    return buttonsList[index];
  }

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
      other is GameBoard &&
        runtimeType == other.runtimeType &&
        buttonsList == other.buttonsList;

  @override
  int get hashCode => buttonsList.hashCode;

  bool inSameRow(int origin, int destination) {
    int indexOfOrigin = pathList.indexOf(origin);
    int indexOfDestination = pathList.indexOf(destination);

    int rowOfOrigin = (indexOfOrigin / boardSize).floor();
    int rowOfDestination = (indexOfDestination / boardSize).floor();

    return rowOfOrigin == rowOfDestination;
  }

  bool inSameColumn(int origin, int destination) {
    int indexOfOrigin = pathList.indexOf(origin);
    int indexOfDestination = pathList.indexOf(destination);

    int columnOfOrigin = (indexOfOrigin % boardSize).floor();
    int columnOfDestination = (indexOfDestination % boardSize).floor();

    return columnOfOrigin == columnOfDestination;
  }

  bool inSameBackwardDiag(int origin, int destination) {
    return false;
  }

}
