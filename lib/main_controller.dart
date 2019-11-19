import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'src/models/bet.dart';
import 'src/models/round.dart';
import 'src/models/player.dart';

class MainController extends ChangeNotifier {

  String currentRoute = '/';
  List<Player> players = List<Player>();
  List<Round> rounds = List<Round>();

  MainController() {
    _init();
  }

  void _init() async {
    startNewGame();
  }

  void startNewGame() {
    rounds.clear();
    players.clear();

    rounds.add(Round(1));
    addNewPlayer(Player(name: 'Harry', image: 'assets/images/avatars/harry.png'));
    addNewPlayer(Player(name: 'Hermione', image: 'assets/images/avatars/hermione.png'));
    addNewPlayer(Player(name: 'Dumbledore', image: 'assets/images/avatars/dumbledore.png'));
  }

  void addNewPlayer(Player player) {
    if (players.length < 6) {
      player.id = Uuid().v1();
      players.add(player);
      rounds.last.players.add(player);
      rounds.last.bets.add(Bet(player.id, 0));
      notifyListeners();
    }
  }


  int getPlayerBetValue({int roundNumber, @required Player player}) {
    roundNumber ??= rounds.length - 1;
    return rounds[roundNumber].bets.firstWhere((bet) => bet.playerId == player.id).betValue;
  }

  void setPlayerBetValue({int roundNumber, @required Player player, @required int betValue}) {
    roundNumber ??= rounds.length - 1; // Get current round
    if (betValue > -1 && betValue <= rounds.length) {
      rounds[roundNumber].bets
          .firstWhere((bet) => bet.playerId == player.id)
          .betValue = betValue;
      notifyListeners();
    }
  }





}
