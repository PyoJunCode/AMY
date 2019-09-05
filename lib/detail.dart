import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/signal.dart';
import 'dart:math';
import 'detail.dart';
import 'menuConsts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/login.dart';
//상세정보. 승아페이지

String stuID;
BuildContext contexts;
AsyncSnapshot snapshots;

class detail extends StatelessWidget {

  //final dynamic document;
  final FirebaseUser user;
  String oppoHakbun;

  detail(this.user, this.oppoHakbun);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(15)),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width:200,
                      height:200,
                      /*child: CircleAvatar(
                            backgroundImage: NetworkImage('http://img.hani.co.kr/imgdb/resize/2014/0201/139114607628_20140201.JPG')
                        )*/
                      child: StreamBuilder(
                        stream: Firestore.instance.collection('profile').where('hakbun', isEqualTo: oppoHakbun).snapshots(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          contexts = context;
                          snapshots = snapshot;

                          if(!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator(),);
                          }
                          var items = snapshot.data?.documents ?? [];

                          return
                            CircleAvatar(
                                backgroundImage: NetworkImage(items[0]['photoURL'])
                            );
                          //one of the List
                        },
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),

                  StreamBuilder(
                      stream: Firestore.instance.collection('users').where('hakbun', isEqualTo: oppoHakbun).snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        contexts = context;
                        snapshots = snapshot;
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator(),);
                        }
                        stuID = snapshot.data.documents[0]['hakbun'];
                        print(stuID);
                        //print(snapshot.data.documents[n]['name']);

                        return
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(snapshot.data.documents[0]['name'], style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xFFfd9dbd)),),
                              Padding(padding: EdgeInsets.all(2)),
                              Text(snapshot.data.documents[0]['age'].toString() + '/ 전산전자공학부'),

                            ],
                          );
                        //one of the List
                      }),

                  /*Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('미노', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: const Color(0xFFfd9dbd)),),
                      Padding(padding: EdgeInsets.all(2)),
                      Text('전산전자공학부', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),),
                      Padding(padding: EdgeInsets.all(2)),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('24'+'세', style: TextStyle(fontSize: 15, color: Colors.grey),),
                            Padding(padding: EdgeInsets.all(5)),
                            Text('|', style: TextStyle(fontSize: 15, color: Colors.grey),),
                            Padding(padding: EdgeInsets.all(5)),
                            Text('서울', style: TextStyle(fontSize: 15, color: Colors.grey),),
                          ]
                      ),
                    ],
                  ),*/
                ]
            ),

            Padding(padding: EdgeInsets.all(10)),


            Container(
              width: 320,
              height: 280,
              color: Color(0xFFffffff),
              padding: EdgeInsets.all(10.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 250.0,
                ),
                child: Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      reverse: true,
                      child : Center(
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(padding: EdgeInsets.all(12)),
                              Container(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('국적         ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),),
                                      Padding(padding: EdgeInsets.all(2)),
                                      Text('키           ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),),
                                      Padding(padding: EdgeInsets.all(2)),
                                      Text('체형         ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),),
                                      Padding(padding: EdgeInsets.all(2)),
                                      Text('혈액형        ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),),
                                      Padding(padding: EdgeInsets.all(2)),
                                      Text('성격         ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),),
                                      Padding(padding: EdgeInsets.all(2)),
                                      Text('흡연여부/정도  ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),),
                                      Padding(padding: EdgeInsets.all(2)),
                                      Text('음주여부/정도  ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),),
                                      Padding(padding: EdgeInsets.all(2)),
                                      Text('종교         ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),),
                                      Padding(padding: EdgeInsets.all(2)),
                                      Text('자기소개      ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),),
                                    ]
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(28)),
                              Container(
                                child: StreamBuilder(
                                    stream: Firestore.instance.collection('users').where('hakbun', isEqualTo: oppoHakbun).snapshots(),
                                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                                      contexts = context;
                                      snapshots = snapshot;
                                      if (!snapshot.hasData) {
                                        return Center(child: CircularProgressIndicator(),);
                                      }
                                      stuID = snapshot.data.documents[0]['hakbun'];

                                      return
                                        Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Text(snapshot.data.documents[0]['nation'], style: TextStyle(fontSize: 17,),),
                                              Padding(padding: EdgeInsets.all(2.5)),
                                              Text(snapshot.data.documents[0]['height'], style: TextStyle(fontSize: 17,),),
                                              Padding(padding: EdgeInsets.all(2.5)),
                                              Text(snapshot.data.documents[0]['body'], style: TextStyle(fontSize: 17,),),
                                              Padding(padding: EdgeInsets.all(2.5)),
                                              Text(snapshot.data.documents[0]['bloodtype'], style: TextStyle(fontSize: 17,),),
                                              Padding(padding: EdgeInsets.all(2.5)),
                                              Text(snapshot.data.documents[0]['character'], style: TextStyle(fontSize: 17,),),
                                              Padding(padding: EdgeInsets.all(2.5)),
                                              Text(snapshot.data.documents[0]['smoke'], style: TextStyle(fontSize: 17,),),
                                              Padding(padding: EdgeInsets.all(2.5)),
                                              Text(snapshot.data.documents[0]['drink'], style: TextStyle(fontSize: 17,),),
                                              Padding(padding: EdgeInsets.all(2.5)),
                                              Text(snapshot.data.documents[0]['religion'], style: TextStyle(fontSize: 17,),),
                                              Padding(padding: EdgeInsets.all(2.5)),
                                              Text(snapshot.data.documents[0]['intro'], style: TextStyle(fontSize: 17,),),
                                            ]
                                        );
                                      //one of the List
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(4.0)),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: (){
                            Navigator.pop(context,
                                MaterialPageRoute(builder: (context) => signalPage(user)));;
                          },
                          iconSize: 48.0,
                          color: Colors.grey,
                        ),
                        Text('뒤로', style: TextStyle(fontSize: 13, color: Colors.grey),),
                      ]
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.favorite),
                          onPressed: (){
                            _check(context);
                          },
                          iconSize: 48.0,
                          color: const Color(0xFFfd9dbd),
                        ),
                        Text('좋아요', style: TextStyle(fontSize: 13, color: const Color(0xFFfd9dbd)),),
                      ]
                  ),
                ]
            ),
          ],
        ),
      ),
    );
  }

  Widget _limitSize() => Container(
    child: Image.asset(
      "assets/images/image/pic1.jpg",
      height: 150,
      width: 100,
    ),


  );
/*
  void _check(BuildContext context) {
    var alert = AlertDialog(
        title: Text('좋아요를 보내시겠습니까?'),
        content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Row(
                children: <Widget>[
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text('예'),

                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text('아니요'),
                    ),
                  ),

                ],
              )

            ]
        )

    );
    showDialog(context: context,builder: (BuildContext context){
      return alert;
    }
    );

  }*/

  void _check(BuildContext context) {
    var now = DateTime.now();
    var alert = AlertDialog(
        title: Text('좋아요를 보내시겠습니까?'),
        content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ButtonBar( mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: Text('예'),
                      onPressed: (){
                        /*Navigator.pop(context);
                        Firestore.instance.collection('heart').document().setData({
                          'a' : stuID,
                          'b' : user.email.split('@')[0],
                        },
                        );*/
                      },
                    ),
                    RaisedButton(
                      child: Text('아니요'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),


                  ]
              )
            ]

        ));
    showDialog(context: context,builder: (BuildContext context){
      return alert;
    }
    );

  }


}