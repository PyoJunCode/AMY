import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'checkID.dart';

// ignore: camel_case_types
class loginPage extends StatefulWidget {

  @override
  _loginPageState createState() => _loginPageState();
}

// ignore: camel_case_types
class _loginPageState extends State<loginPage> {

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;

  final textEditingController = TextEditingController();

  @override
  void dispose(){
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: buildAppBar(),

        body: buildBody(),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('Log-in', style: TextStyle(color: Colors.white)),

      actions: <Widget>[

      ],
    );
  }

  buildBody() {

    String mail;

    return Center(child: Column(

      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(padding: const EdgeInsets.all(40)),

        Text('Han Man Chu', style: TextStyle(fontSize: 40,
            fontWeight: FontWeight.bold),),
        Padding(padding: const EdgeInsets.all(10)),
        Text('Sign in with HGU Mail', style: TextStyle(fontSize: 20,)),

        Padding(padding: const EdgeInsets.all(20)),
        IconButton(icon: Icon(Icons.vpn_key,
          size: 50,
          ),
          onPressed: () {

           SignInMathod().then((user) {
             mail= user.email.split('@')[1];

             if(mail == 'handong.edu') {
               Navigator.pushReplacement(context, MaterialPageRoute(
                   builder: (context) => checkPage(user)));
             }

             else{
               handong(context);
               FirebaseAuth.instance.signOut();
               googleSignIn.signOut();
             }
           });
          },
        )

      ],
    )
    );

  }

  Future<FirebaseUser> SignInMathod() async {
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = await auth.signInWithCredential(
      GoogleAuthProvider.getCredential(idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken));
    return user;
  }

}

  void handong(BuildContext context){
    var alert = AlertDialog(
      title: Text('오류'),
      content: Text('한동대 메일로 로그인 해주세요'),
    );

    showDialog(context: context,builder: (BuildContext context){
      return alert;
    }
    );
  }

