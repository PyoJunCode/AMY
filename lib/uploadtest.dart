import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'myinfo.dart';

class uploadtest extends StatefulWidget {

  final FirebaseUser user;

  uploadtest(this.user);


  @override
  _uploadtestState createState() => _uploadtestState();
}

class _uploadtestState extends State<uploadtest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('test'),),
      floatingActionButton: FloatingActionButton(onPressed: () { Navigator.pushReplacement(
          context, MaterialPageRoute(builder:  (context) => myInfoPage(widget.user)));}),
      body: buildBody(),
  );
}

  buildBody() {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child : _getImg(),
      )
    );
  }

  _buildListItem(BuildContext context, items) {

    var string = items['userID'];
    print(string);
    return Image.network(items['photoURL'],
    fit: BoxFit.cover,);


  }

  _getImg(){


    return StreamBuilder(

      stream: Firestore.instance.collection('profile').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),);
        }

        var items = snapshot.data?.documents ?? [] ; //documnets is list

          return _buildListItem(context, items[7]); //one of the List


//        return GridView.builder(
//            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 5),
//            itemCount: items.length,
//            itemBuilder: (context, index){
//              return _buildListItem(context, items[index]);
//            } );
      },
    );
  }
}
