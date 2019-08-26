import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth.dart';
import 'auth1.dart';
import 'front.dart';
import 'login.dart';


class checkPage extends StatelessWidget {

  final FirebaseUser user;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool first = true;

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

              checkAuth();

              Navigator.push(context, MaterialPageRoute(
                    builder: (context) => frontPage(user)));

//              if(first == false) {
//                Navigator.pushReplacement(context, MaterialPageRoute(
//                    builder: (context) => frontPage(user)));
//              }else{
//                Navigator.pushReplacement(context, MaterialPageRoute(
//                    builder: (context) => MyApp(user)));
//              }


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

  Future<Null> checkAuth() async {

    if(user != null){ //처음오는게 아니면 documents로 가져온다.

      final QuerySnapshot result = await Firestore.instance
          .collection('users')
          .where(user.email.split('@')[0])
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;


      if(documents.length == 0){
        print('new auth');
        print('setData');// 길이가 0이면 기본세팅
        Firestore.instance.collection('users').document(user.email.split('@')[0]).setData({
          'hakbun' : user.email.split('@')[0],
          'name' : user.displayName,
          'gender' : 'male'
        });

        first = false;
      }
    first = false;

    }

    else first = true;



  }
}
