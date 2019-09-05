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

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('test'),),
      floatingActionButton: FloatingActionButton(onPressed: () {

        setState(() {
          index++;
        });

        print('index : ' + index.toString());
        _getImg();


      }),
      body: buildBody(),
  );
}

  buildBody() {
    return Center(
      child: SizedBox(
        width: 200,
        height: 400,
        child : Column(children: <Widget>[
         _getImg(),
         Text('index' + index.toString())
         ,

        ],
      )
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

      stream: Firestore.instance.collection('profile').where('hakbun', isEqualTo: '21800370').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),);
        }

        var items = snapshot.data?.documents ?? [] ; //documnets is list

        return
          Image.network(
          items[index]['photoURL'],
          fit: BoxFit.cover,
        ); //one of the List


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
