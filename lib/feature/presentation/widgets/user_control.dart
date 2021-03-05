


import 'dart:developer';

import 'package:demo_architecture/feature/presentation/bloc/userinform/user_inform_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserControls extends StatefulWidget {
  const UserControls({
    Key key,
  }) : super(key: key);

  @override
  _UserControlsState createState() => _UserControlsState();
}


class _UserControlsState extends State<UserControls> {
  final controller = TextEditingController();
  String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                child: Text('Search'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: dispatchConcrete,
              ),
            ),

          ],
        )
      ],
    );
  }

  void dispatchConcrete() {
    // Clearing the TextField to prepare it for the next inputted number
    controller.clear();
    log("get---");
    BlocProvider.of<UserInformBloc>(context)
        .dispatch(GetForUserInform());
  }

  void dispatchRandom() {
    controller.clear();
  }
}