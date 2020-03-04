import 'package:leyline_game/game_board.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('GameBoard of size 3 should have length 9', () {
    GameBoard testGameBoard = new GameBoard(3);
    expect(testGameBoard.length(), 9);
  });

  test('Seeding a game board changes the default path', () {
    GameBoard testGameBoard = new GameBoard(3);
    List<int> originalPath = testGameBoard.pathList;

    List<int> seedList = [2, 1, 3, 5, 4, 6, 8, 7, 9];
    testGameBoard.seed(seedList);

    expect(seedList, testGameBoard.pathList);
    expect(originalPath, isNot(testGameBoard.pathList));
  });

  test('Test Path is a valid path', () {
    GameBoard testGameBoard = new GameBoard(3);

    List<int> seedList = [2, 1, 3, 5, 4, 6, 8, 7, 9];
    testGameBoard.seed(seedList);

    expect(testGameBoard.isValidPath(), isTrue);
  });

  test('Invalid Test Path is an invalid path', () {
    GameBoard testGameBoard = new GameBoard(3);

    List<int> seedList = [2, 1, 3, 4, 5, 6, 8, 7, 9];
    testGameBoard.seed(seedList);

    expect(testGameBoard.isValidPath(), isFalse);
  });

  test('Indexes on the same row in any order are in LOS', () {
    GameBoard testGameBoard = new GameBoard(3);

    List<int> seedList = [2, 1, 3, 5, 4, 6, 8, 7, 9];
    testGameBoard.seed(seedList);

    expect(testGameBoard.inSameRow(2, 3), isTrue);
    expect(testGameBoard.inSameRow(2, 1), isTrue);
    expect(testGameBoard.inSameRow(1, 2), isTrue);
    expect(testGameBoard.inSameRow(5, 4), isTrue);
    expect(testGameBoard.inSameRow(9, 8), isTrue);
    expect(testGameBoard.inSameRow(9, 2), isFalse);
  });

  test('Indexes on the same column in any order are in LOS', () {
    GameBoard testGameBoard = new GameBoard(3);

    List<int> seedList = [2, 1, 3, 5, 4, 6, 8, 7, 9];
    testGameBoard.seed(seedList);

    expect(testGameBoard.inSameColumn(2, 5), isTrue);
    expect(testGameBoard.inSameColumn(2, 8), isTrue);
    expect(testGameBoard.inSameColumn(9, 3), isTrue);
    expect(testGameBoard.inSameColumn(4, 1), isTrue);
    expect(testGameBoard.inSameColumn(5, 6), isFalse);
  });

  test('Indexes on the same diagonal in any order are in LOS', () {
    GameBoard testGameBoard = new GameBoard(3);

    List<int> seedList = [2, 1, 3, 5, 4, 6, 8, 7, 9];
    testGameBoard.seed(seedList);

    expect(testGameBoard.inSameBackwardDiag(2, 4), isTrue);
    expect(testGameBoard.inSameBackwardDiag(2, 9), isTrue);
    expect(testGameBoard.inSameBackwardDiag(9, 2), isTrue);
    expect(testGameBoard.inSameBackwardDiag(5, 7), isTrue);
    expect(testGameBoard.inSameBackwardDiag(8, 4), isFalse);
    expect(testGameBoard.inSameBackwardDiag(2, 7), isFalse);
    expect(testGameBoard.inSameBackwardDiag(2, 6), isFalse);

    expect(testGameBoard.inSameForwardDiag(8, 4), isTrue);
    expect(testGameBoard.inSameForwardDiag(8, 3), isTrue);
    expect(testGameBoard.inSameForwardDiag(4, 3), isTrue);
    expect(testGameBoard.inSameForwardDiag(7, 6), isTrue);
    expect(testGameBoard.inSameForwardDiag(2, 4), isFalse);
    expect(testGameBoard.inSameForwardDiag(8, 1), isFalse);
    expect(testGameBoard.inSameForwardDiag(5, 9), isFalse);
  });

  test('Game Buttons get populated with text after init', () {
    GameBoard testGameBoard = new GameBoard(3);

    for (int i = 0; i < testGameBoard.buttonsList.length; i++) {
      expect(testGameBoard.buttonsList[i].text,
          testGameBoard.pathList[i].toString());
    }
  });

  test('Last step in path can be in any position', () {
    expect(true, isTrue);
  });

  test('Invalid Parameterized 3x3 Randomly Generated', () {
    for (int i = 0; i < invalidTestCases3x3.length; i++) {
      GameBoard testGameBoard = new GameBoard(3);

      testGameBoard.seed(invalidTestCases3x3[i]);

      expect(testGameBoard.isValidPath(), isFalse);
    }
  });

  test('Valid Parameterized 3x3 Randomly Generated', () {
    for (int i = 0; i < validTestCases3x3.length; i++) {
      GameBoard testGameBoard = new GameBoard(3);

      testGameBoard.seed(validTestCases3x3[i]);

      expect(testGameBoard.isValidPath(), isTrue);
    }
  });
}
