import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'detail.dart';
import 'menuConsts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/login.dart';

//매칭페이지. 상대찾는 메인 페이지. 랜덤으로 사람 보여주는거

class matchPage extends StatefulWidget {

  final FirebaseUser user;

  matchPage(this.user);


  @override
  _matchState createState() => _matchState();
}

class _matchState extends State<matchPage> {

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


  /*buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('한만추', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),

      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: menuChoise,
          itemBuilder: (BuildContext context) {
            return menuConsts.choices.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice, style: TextStyle(color: Colors.pinkAccent),),
              );
            }).toList();
          },
          icon: Icon(Icons.library_add, color: Colors.black,),
          offset: Offset(0,40),
        )
      ],
    );
  }*/

  menuChoise(String choise) {
    if(choise == menuConsts.major){

    }
  }

  getUserInfo (FirebaseUser user ) async {

    final QuerySnapshot result = await Firestore.instance
        .collection('users')
        .where('hakbun', isEqualTo: user.email.split('@')[0]) // 2번에도 적용가능. where 으로 특정 필드값에 만족하는 항목 가져올수있음.
        .getDocuments();

    final List<DocumentSnapshot> documents = result.documents;

    userGender = documents[0]['gender'];
    print('user Gender is ' + userGender);


  }

  getoppoUserCount(String oppoGender) async {

    var respectsQuery = await Firestore.instance
        .collection('users')
        .where('gender', isEqualTo: oppoGender);
    var querySnapshot = await respectsQuery.getDocuments();
    var totalEquals = querySnapshot.documents.length;

    oppoGenderCount = totalEquals;

    randomNum = Random().nextInt(oppoGenderCount);

    return totalEquals as int;

  }

  getRandomHakbun(String oppoGender, int rand)  async {

    var respectsQuery = await Firestore.instance
        .collection('users')
        .where('gender', isEqualTo: oppoGender);
    var list = await respectsQuery.getDocuments();

    setState(() {
      oppoHakbun = list.documents[rand]['hakbun'].toString();
    });

    oppoName = list.documents[rand]['name'].toString();
    oppoMajor = list.documents[rand]['major'].toString();
    oppoAge = list.documents[rand]['age'].toString();



    return list.documents;


  }

  buildBody() {

    getUserInfo(widget.user); // set userGender

    oppoGender = userGender == '남자'? '여자' : '남자';



    getoppoUserCount(oppoGender); // get random num too

    //getRandomHakbun(oppoGender, randomNum);

    print('oppoGender is ' + oppoGender);




    print('hakbun = ' +oppoHakbun );

    return Center(
      child: Container(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(37)),
              Text('- 오늘의 랜덤매칭 -', style: TextStyle(fontSize: 18,color: const Color(0xFF696868))),
              Padding(padding: EdgeInsets.all(5)),
              Text('이분은 어떠신가요?',
                  style: TextStyle(fontSize: 31,fontWeight: FontWeight.bold, color: const Color(0xFFfd9dbd))),
              Text('상세정보를 눌러 상대에 대해 더 알아보세요 :)',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              Padding(padding: EdgeInsets.all(5)),
              SingleChildScrollView(
                child: SizedBox(
                  width: 310,
                  height: 307,
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
//                                  while(oppoHakbun != 'null') {
//                                    setState(() {
//                                      getRandomHakbun(oppoGender, randomNum);
//                                    });
//
//                                  }
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
                              contexts = context;
                              snapshots = snapshot;
                              if (oppoHakbun == 'null') {
                                return Center(child: CircularProgressIndicator(),);
                              }
                              stuID = snapshot.data.documents[0]['hakbun'];
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
                                child: Text('좋아요', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: const Color(0xFFffffff)),),
                              ),
                            ], //column widget
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  child: Flexible(
                    fit: FlexFit.loose,
                    child: IconButton(icon: Icon(Icons.arrow_forward, size: 40,color: const Color(0xFFfd9dbd),),
                      onPressed: () {
                       setState(() {
                         getRandomHakbun(oppoGender, randomNum);
                       });
                      },),
                  )
              ),
              Text('다음', style: TextStyle(fontSize: 13, color: const Color(0xFFfd9dbd)),),
            ]
        ),
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