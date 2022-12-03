import 'package:flutter/material.dart';
import 'package:jogo_da_velha/core/constants.dart';
import 'package:jogo_da_velha/core/winner_rules.dart';
import 'package:jogo_da_velha/enums/player_type.dart';
import 'package:jogo_da_velha/enums/winner_type.dart';
import 'package:jogo_da_velha/models/board_tile.dart';

class GameController {
  List<BoardTile> tiles = [];
  List<int> movesPlayer1 = [];
  List<int> movesPlayer2 = [];
  PlayerType currentPlayer;
  bool isSinglePlayer;

  bool get hasMoves =>
      (movesPlayer1.length + movesPlayer2.length) != BOARD_SIZE;

  GameController() {
    _initialize();
  }

  void _initialize() {
    movesPlayer1.clear();
    movesPlayer2.clear();
    currentPlayer = PlayerType.player1;
    isSinglePlayer = false;
    tiles =
        List<BoardTile>.generate(BOARD_SIZE, (index) => BoardTile(index + 1));
  }

  void reset() {
    _initialize();
  }

  void markBoardTileByIndex(index) {
    final tile = tiles[index];
    if (currentPlayer == PlayerType.player1) {
      _markBoardTileWithPlayer1(tile);
    } else {
      _markBoardTileWithPlayer2(tile);
    }
    tile.enable = false;
  }
}
