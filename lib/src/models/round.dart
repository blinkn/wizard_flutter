import 'package:wizard_flutter/src/models/player.dart';

import 'bid.dart';

class Round {

  int roundNumber;

  List<Bid> bids = List<Bid>();
  List<Player> players = List<Player>();

  Round({this.roundNumber});

}
