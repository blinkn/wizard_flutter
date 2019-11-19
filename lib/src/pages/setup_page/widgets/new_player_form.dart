import 'package:flutter/material.dart';
import 'package:wizard_flutter/src/enums/confirm_action.dart';
import 'package:wizard_flutter/src/models/player.dart';
import 'package:wizard_flutter/src/pages/setup_page/widgets/player_image_selector.dart';

class NewPlayerForm extends StatefulWidget {
  final Player player;

  NewPlayerForm(this.player);

  @override
  _NewPlayerFormState createState() => _NewPlayerFormState();
}

class _NewPlayerFormState extends State<NewPlayerForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Player'),
      backgroundColor: Colors.white,
      content: _buildForm(),
      actions: _buildActions(),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                  validator: (value) {
                    return value.isEmpty ? 'Please, fill the player\'s name' : null;
                  },
                  decoration: InputDecoration(labelText: 'Player Name'),
                  onChanged: (text) {
                    widget.player.name = text;
                  }),
              SizedBox(
                height: 32,
              ),
              Text('Player Image'),
              SizedBox(
                height: 8,
              ),
              PlayerImageSelector(widget.player)
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildActions() {
    return <Widget>[
      FlatButton(
        child: Text('CONFIRM'),
        onPressed: () {
          if (_formKey.currentState.validate())
            Navigator.pop(context, ConfirmAction.CONFIRMED);
        },
      ),
      FlatButton(
        child: Text(
          'CANCEL',
          style: TextStyle(color: Colors.grey),
        ),
        onPressed: () {
          Navigator.pop(context, ConfirmAction.CANCELLED);
        },
      ),
    ];
  }
}
