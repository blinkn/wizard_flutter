import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'src/models/bid.dart';
import 'src/models/round.dart';
import 'src/models/player.dart';

class MainController extends ChangeNotifier {

  String currentRoute = '/';
  List<Player> players = List<Player>();
  List<Round> rounds = List<Round>();

  var _maxRounds = {
    '3': 20,
    '4': 15,
    '5': 12,
    '6': 10,
  };

  MainController() {
    _init();
  }

  void _init() async {
    startNewGame();
  }

  int get maxRounds {
    return _maxRounds[players.length.toString()];
  }

  int get currentRound {
    return rounds.length;
  }

  int get currentRoundIndex {
    return rounds.length-1;
  }

  bool get isGameOver {
    return currentRound >= maxRounds;
  }

  void startNewGame() {
    rounds.clear();
    players.clear();

    rounds.add(Round(roundNumber: 1));
    addNewPlayer(Player(name: 'Harry', image: 'assets/images/avatars/harry.png'));
    addNewPlayer(Player(name: 'Hermione', image: 'assets/images/avatars/hermione.png'));
    addNewPlayer(Player(name: 'Dumbledore', image: 'assets/images/avatars/dumbledore.png'));
    startRound();
  }

  void addNewPlayer(Player player) {
    if (players.length < 6) {
      player.id = Uuid().v1();
      players.add(player);
      notifyListeners();
    }
  }

  int getPlayerBidValue({int roundIndex, @required Player player}) {
    roundIndex ??= currentRoundIndex;
    return rounds[roundIndex].bids.firstWhere((bid) => bid.playerId == player.id).bidValue;
  }

  int getPlayerTrickValue({int roundIndex, @required Player player}) {
    roundIndex ??= currentRoundIndex;
    return rounds[roundIndex].bids.firstWhere((bid) => bid.playerId == player.id).trickValue;
  }

  void setPlayerBidValue({int roundIndex, @required Player player, @required int bidValue}) {
    roundIndex ??= currentRoundIndex;

    if (bidValue > -1 && bidValue <= currentRound) {
      rounds[roundIndex].bids
          .firstWhere((bid) => bid.playerId == player.id)
          .bidValue = bidValue;
      notifyListeners();
    }
  }

  void increasePlayerTrickValue({int roundIndex, @required Player player}) {
    roundIndex ??= currentRoundIndex; // Get current round

    int sumTrickValues = rounds[roundIndex].bids.fold(0, (acc, cur) => acc + cur.trickValue);
    if (sumTrickValues + 1 > currentRound) {
      return;
    }

    rounds[roundIndex].bids
        .firstWhere((bid) => bid.playerId == player.id)
        .trickValue++;

    notifyListeners();

  }

  void decreasePlayerTrickValue({int roundIndex, @required Player player}) {
    roundIndex ??= currentRoundIndex; // Get current round

    int playerTrickValue = rounds[roundIndex].bids
        .firstWhere((bid) => bid.playerId == player.id)
        .trickValue;

    if (playerTrickValue == 0) return;

    rounds[roundIndex].bids
        .firstWhere((bid) => bid.playerId == player.id)
        .trickValue--;

    notifyListeners();

  }

  void goToNextRound() {

    computeScore(currentRoundIndex);

    if (!isGameOver) {
      rounds.add(Round(roundNumber: currentRound+1));
      players.sort((a, b) => b.score.compareTo(a.score)); // sort high scored players
      startRound();
    }
  }

  void startRound() {
    rounds.last.players.addAll(players);
    rounds.last.bids.addAll(players.map((player) => Bid(player.id, 0)));
  }

  void computeScore(int roundNumber) {
    List<Bid> bids = rounds[roundNumber].bids;

    for(Player player in players) {
      Bid bid = bids.firstWhere((bid) => bid.playerId == player.id);
      if (bid.trickValue == bid.bidValue) {
        player.score += 20 + (bid.bidValue * 10);
      } else {
        player.score -= (bid.trickValue - bid.bidValue).abs() * 10;
        if (player.score <= 0) {
          player.score = 0;
        }
      }
    }
    notifyListeners();
  }


}
