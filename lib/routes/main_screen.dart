import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainScreen extends StatelessWidget {
  final GoogleSignInAccount googleUser;
  final FirebaseUser firebaseUser;

  const MainScreen(
      {Key key, @required this.googleUser, @required this.firebaseUser})
      : assert(googleUser != null),
        assert(firebaseUser != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Offstage(
              offstage: googleUser.photoUrl == null,
              child: CircleAvatar(
                  backgroundImage: NetworkImage(googleUser.photoUrl)),
            ),
            SizedBox(height: 8.0),
            Text(googleUser.displayName, style: theme.textTheme.title),
            Text(googleUser.email),
            Text(firebaseUser.phoneNumber, style: theme.textTheme.subhead),
          ],
        ),
      ),
    );
  }
}
