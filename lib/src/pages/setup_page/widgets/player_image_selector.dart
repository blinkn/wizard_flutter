import 'package:flutter/material.dart';
import 'package:wizard_flutter/src/models/player.dart';

class PlayerImageSelector extends StatefulWidget {

  final Player player;
  PlayerImageSelector(this.player);

  @override
  _PlayerImageSelectorState createState() => _PlayerImageSelectorState();
}

class _PlayerImageSelectorState extends State<PlayerImageSelector> {

  String _selectedAvatar = '';

  List<String> _avatars = [
    'assets/images/avatars/gandalf.png',
    'assets/images/avatars/saruman.png',
    'assets/images/avatars/harry.png',
    'assets/images/avatars/dumbledore.png',
    'assets/images/avatars/minerva.png',
    'assets/images/avatars/hermione.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 300,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: _avatars.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedAvatar = _avatars[index];
              });
              widget.player.image = _selectedAvatar;
            },
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: _avatars[index] == _selectedAvatar ? 1 : .5,
              child: CircleAvatar(
                backgroundImage: AssetImage(_avatars[index]),
                radius: 30,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 16,
          );
        },
      ),
    );
  }
}
