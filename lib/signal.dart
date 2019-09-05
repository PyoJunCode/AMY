import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'detail.dart';
import 'menuConsts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/login.dart';

//매칭페이지. 상대찾는 메인 페이지. 랜덤으로 사람 보여주는거

class signalPage extends StatefulWidget {

  final FirebaseUser user;

  signalPage(this.user);


  @override
  _signalPageState createState() => _signalPageState();
}

class _signalPageState extends State<signalPage> {

  int menu_select = 0;
  String userGender = '남자';
  String oppoGender = 'null';


  String oppoHakbun = 'null';
  String oppoName = 'null';
  String oppoMajor = 'null';
  String oppoAge = 'null';

  int oppoGenderCount ;
  int randomUser ;
  int randomHakbun  ;
  int index = 0;
  int randomNum ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: buildAppBar(),
      backgroundColor: const Color(0xFFfff8fb),
      //backgroundColor: const Color(0xFFffe6f1),
      body: buildBody(),
    );
  }

  void changeMenu(int menu_index) {
    setState(() {
      menu_select = menu_index;
    });
  }

  void getRandomUser(){

  }



  menuChoise(String choise) {
    if(choise == menuConsts.major){

    }
  }

  getUserInfo (FirebaseUser user ) async {

    final QuerySnapshot result = await Firestore.instance
        .collection('users')
        .where('hakbun', isEqualTo: widget.user.email.split('@')[0]) // 2번에도 적용가능. where 으로 특정 필드값에 만족하는 항목 가져올수있음.
        .getDocuments();

    final List<DocumentSnapshot> documents = result.documents;

    userGender = documents[0]['gender'];



  }

  getoppoUserCount(String oppoGender) async {

    var respectsQuery = await Firestore.instance
        .collection('heart')
        .where('a', isEqualTo: widget.user.email.split('@')[0]);
    var querySnapshot = await respectsQuery.getDocuments();
    var totalEquals = querySnapshot.documents.length;
    print('total : ' + totalEquals.toString());
    oppoGenderCount = totalEquals;


    return totalEquals as int;

  }

  getRandomHakbun(int n)  async {

    var respectsQuery = await Firestore.instance
        .collection('heart')
        .where('a', isEqualTo: widget.user.email.split('@')[0]);
    var list = await respectsQuery.getDocuments();

    setState(() {
      oppoHakbun = list.documents[n]['b'].toString();
    });


//    oppoName = list.documents[n]['name'].toString();
//    oppoMajor = list.documents[n]['major'].toString();
//    oppoAge = list.documents[n]['age'].toString();



    return list.documents;


  }

  buildBody() {


      getUserInfo(widget.user); // set userGender

      oppoGender = userGender == '남자'? '여자' : '남자';



      getoppoUserCount(oppoGender); // get random num too

      getRandomHakbun(index);



    print('oppoGender is ' + oppoGender);




    print('hakbun = ' +oppoHakbun );



    return Center(
      child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(37)),
            Text('- 도착한 편지함 -', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF696868))),
            Padding(padding: EdgeInsets.all(5)),
//            Text('이분은 어떠신가요?',
//                style: TextStyle(fontSize: 31,fontWeight: FontWeight.bold, color: const Color(0xFFfd9dbd))),
//            Text('상세정보를 눌러 상대에 대해 더 알아보세요 :)',
//                style: TextStyle(fontSize: 14, color: Colors.grey)),
            Padding(padding: EdgeInsets.all(5)),
            SizedBox(
              width: 310,
              height: 357,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(12)),
                    SizedBox(
                        width: 180,
                        height: 180,
                        child: StreamBuilder(
                          stream: Firestore.instance.collection('profile').where('hakbun', isEqualTo: oppoHakbun).snapshots(),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            if(oppoHakbun == 'null') {
                              return Center(child: CircularProgressIndicator(),);
                            }

                            var items = snapshot.data?.documents ?? [] ; //documnets is list


                            print(items.length);


                            return
                              Image.network(
                                items[0]['photoURL'],
                                fit: BoxFit.cover,
                              ); //one of the List


                          },
                        )//Image.network(url)

                    ),
                    Padding(padding: EdgeInsets.all(5)),

                    StreamBuilder(
                        stream: Firestore.instance.collection('users').where('hakbun', isEqualTo: oppoHakbun).snapshots(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (oppoHakbun == 'null') {
                            return Center(child: CircularProgressIndicator(),);
                          }
                          // stuID = snapshot.data.documents[0]['hakbun'];
                          return
                            Column(
                              children: <Widget>[
                                Text(snapshot.data.documents[0]['name'], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),),
                                Padding(padding: EdgeInsets.all(1)),
                                Text(snapshot.data.documents[0]['age'].toString()+' / '+ snapshot.data.documents[0]['hakbu'], style: TextStyle(fontSize: 14),),
                              ],
                            );
                          //one of the List
                        }),
                    /*Text('미노', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),),
                    Padding(padding: EdgeInsets.all(1)),
                    Text('24'+' / '+'전산전자공학부', style: TextStyle(fontSize: 14),),*/
                    Padding(padding: EdgeInsets.all(6)),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          RaisedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder:  (context) => detail(widget.user, oppoHakbun)));
                          }, color: const Color(0xFFf9c8d9),
                            child: Text('상세정보', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: const Color(0xFFffffff)),),
                          ),
                          Padding(padding: EdgeInsets.all(3)),
                          RaisedButton(onPressed: (){
                          }, color: const Color(0xFFf9c8d9),
                            child: Text('수락하기', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: const Color(0xFFffffff)),),
                          ),
                        ], //column widget
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                child: Flexible(
                  fit: FlexFit.loose,
                  child: IconButton(icon: Icon(Icons.arrow_forward, size: 40,color: const Color(0xFFfd9dbd),),
                    onPressed: () {

                      setState(() {



                        getRandomHakbun(index);

                        if(index >= oppoGenderCount -1) index = 0;
                        else
                          index ++;

                        //buildBody();
                      });

                      print('hakbun' + oppoHakbun);
                      print('index = ' + index.toString());
                    },),
                )
            ),
            Text('다음', style: TextStyle(fontSize: 13, color: const Color(0xFFfd9dbd)),),
          ]
      ),
    );
  }

}

void sendM(BuildContext context){
  var alert = AlertDialog(
    title: Text('관심표현'),
    content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.send),
              labelText: '마음을 표현해보세요',
            ),
          ),
          IconButton(icon: Icon(Icons.send,
            size: 40,
          ),
            onPressed: () {},
          ),
        ]
    ),
  );

  showDialog(context: context,builder: (BuildContext context){
    return alert;
  }
  );
}