import 'package:wizard_flutter/src/models/player.dart';

import 'bet.dart';

class Round {

  int roundNumber;

  List<Bet> bets = List<Bet>();
  List<Player> players = List<Player>();

  Round(this.roundNumber);

}
