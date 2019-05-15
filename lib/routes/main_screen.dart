import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:phone_auth/routes/auth.dart';

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
              offstage: firebaseUser.photoUrl == null,
              child: CircleAvatar(
                  backgroundImage: NetworkImage(firebaseUser.photoUrl)),
            ),
            SizedBox(height: 8.0),
            Text(firebaseUser.displayName, style: theme.textTheme.title),
            Text(firebaseUser.email),
            Text(firebaseUser.phoneNumber, style: theme.textTheme.subhead),
            SizedBox(height: 16.0),
            FlatButton(
              child: Text("Sign out", style: theme.textTheme.button),
              onPressed: () async {
                await GoogleSignIn().signOut();
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(builder: (context) => AuthScreen()),
                  (route) => false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
