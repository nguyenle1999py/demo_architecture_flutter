import 'package:demo_architecture/feature/domain/entities/user/user_inform.dart';
import 'package:flutter/cupertino.dart';

class UserDisplay extends StatelessWidget {
  final UserInform userInform;

  const UserDisplay({
    Key key,
    this.userInform,
  })  : assert(userInform != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: <Widget>[
          // Fixed size, doesn't scroll
          Text(
            "Fuck",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Expanded makes it fill in all the remaining space
          Expanded(
            child: Center(
              // Only the trivia "message" part will be scrollable
              child: SingleChildScrollView(
                child: Text(
                  userInform.userName,
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}