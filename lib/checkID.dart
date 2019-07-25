import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'front.dart';
import 'login.dart';


class checkPage extends StatelessWidget {

  final FirebaseUser user;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  checkPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome',style: TextStyle(fontSize: 30, color: Colors.white),)
      ),
      body: Padding(padding: EdgeInsets.all(50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 100,
              child: Card(
                elevation: 4.0,
                child: Padding(padding: EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(8)),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.photoUrl),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10),),
                    Text(user.displayName+' 님'),
                  ],
                ),),
              ),
            ),
            RaisedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => frontPage(user)));
            }, color: const Color(0xFFffdbf8),
               child: Text('입장하기'),
            ),
            RaisedButton(onPressed: () {
              FirebaseAuth.instance.signOut();
              googleSignIn.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => loginPage()));

            },
              color: const Color(0xFFffdbf8),
              child: Text('로그아웃'),)
          ],
        ),
      ),)
    );
  }
}
