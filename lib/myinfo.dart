import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/modify.dart';
import 'package:firebase_auth/firebase_auth.dart';

//내정보페이지

String stuID;
BuildContext contexts;
AsyncSnapshot snapshots;

class myInfoPage extends StatelessWidget {

  //final dynamic document;
  final FirebaseUser user;

  myInfoPage(this.user);

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
                      width:170,
                      height:170,
                      /*child: CircleAvatar(
                            backgroundImage: NetworkImage('http://img.hani.co.kr/imgdb/resize/2014/0201/139114607628_20140201.JPG')
                        )*/
                      child: StreamBuilder(
                        stream: Firestore.instance.collection('profile').where('hakbun', isEqualTo: user.email.split('@')[0]).snapshots(),
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
                      stream: Firestore.instance.collection('users').where('hakbun', isEqualTo: user.email.split('@')[0]).snapshots(),
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
                              Text(snapshot.data.documents[0]['age'].toString() + '/' + snapshot.data.documents[0]['hakbu']),

                            ],
                          );
                        //one of the List
                      }),

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
                                      Text('카카오 ID      ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),),
                                      Padding(padding: EdgeInsets.all(2)),
                                    ]
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(28)),
                              Container(
                                child: StreamBuilder(
                                    stream: Firestore.instance.collection('users').where('hakbun', isEqualTo: user.email.split('@')[0]).snapshots(),
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
                                              Padding(padding: EdgeInsets.all(2.5)),
                                              Text(snapshot.data.documents[0]['kakaoid'], style: TextStyle(fontSize: 17,),),
                                              Padding(padding: EdgeInsets.all(2.5)),
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

            IconButton(icon: Icon(Icons.arrow_drop_down_circle, size: 40, color: Color(0xFFfd9dbd),),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => modify(user)));
              },
            ),
            Text('수정', style: TextStyle(color: Color(0xFFfd9dbd),),),
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

}