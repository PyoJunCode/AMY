import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

import 'match.dart';

//회원가입

class modify extends StatefulWidget {


  final FirebaseUser user;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  modify(this.user);



  @override
  _modifyState createState() => _modifyState();
}

class _modifyState extends State<modify> {



  BuildContext ctx;
  List<DropdownMenuItem<String>> gender=[];
  List<DropdownMenuItem<int>> age=[];
  List<DropdownMenuItem<String>> hakbu=[];
  List<DropdownMenuItem<String>> nationality=[];
  List<DropdownMenuItem<String>> location=[];
  List<DropdownMenuItem<String>> height=[];
  List<DropdownMenuItem<String>> body=[];
  List<DropdownMenuItem<String>> btype=[];
  List<DropdownMenuItem<String>> charac=[];
  List<DropdownMenuItem<String>> smoke=[];
  List<DropdownMenuItem<String>> drink=[];
  List<DropdownMenuItem<String>> religion=[];

  String name1 = null;
  String gender1 = null;
  int age1 = null;
  String hakbu1 = null;
  String nationality1 = null;
  String location1 = null;
  String height1 = null;
  String body1 = null;
  String btype1 = null;
  String charac1 = null;
  String smoke1 = null;
  String drink1 = null;
  String religion1 = null;
  String intro1 = null;
  String kakaoid1 = null;

  File imageFile;



  loadImg() {
    return StreamBuilder(
      stream: Firestore.instance.collection('profile').where('hakbun', isEqualTo: widget.user.email.split('@')[0]).snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData) {
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
    );
  }

  void getImg() async{
    /*var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState((){
      imageFile = picture;
    });*/
    File image = await ImagePicker.pickImage(source:
    ImageSource.gallery);
    setState((){
      imageFile = image;
    });

  }

  void loadGender(){
    gender = [];
    gender.add(new DropdownMenuItem(
      child: new Text('남자',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'남자',
    ));
    gender.add(new DropdownMenuItem(
      child: new Text('여자',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'여자',
    ));
  }

  void loadAge(){
    age = [];
    age.add(new DropdownMenuItem(
      child: new Text('20',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:20,
    ));
    age.add(new DropdownMenuItem(
      child: new Text('21',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:21,
    ));
    age.add(new DropdownMenuItem(
      child: new Text('22',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:22,
    ));
    age.add(new DropdownMenuItem(
      child: new Text('23',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:23,
    ));
    age.add(new DropdownMenuItem(
      child: new Text('24',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:24,
    ));
    age.add(new DropdownMenuItem(
      child: new Text('25',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:25,
    ));
    age.add(new DropdownMenuItem(
      child: new Text('26',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:26,
    ));
    age.add(new DropdownMenuItem(
      child: new Text('27',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:27,
    ));
    age.add(new DropdownMenuItem(
      child: new Text('28',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:28,
    ));
    age.add(new DropdownMenuItem(
      child: new Text('29',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:29,
    ));
  }

  void loadHakbu(){
    hakbu = [];
    hakbu.add(new DropdownMenuItem(
      child: new Text('글로벌리더십',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'글로벌리더십',
    ));
    hakbu.add(new DropdownMenuItem(
      child: new Text('국제어문',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'국제어문',
    ));
    hakbu.add(new DropdownMenuItem(
      child: new Text('경영경제',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'경영경제',
    ));
    hakbu.add(new DropdownMenuItem(
      child: new Text('법학',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'법학',
    ));
    hakbu.add(new DropdownMenuItem(
      child: new Text('언론정보',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'언론정보',
    ));
    hakbu.add(new DropdownMenuItem(
      child: new Text('상담복지',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'상담복지',
    ));
    hakbu.add(new DropdownMenuItem(
      child: new Text('생명과학',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'생명과학',
    ));
    hakbu.add(new DropdownMenuItem(
      child: new Text('공간환경시스템',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'공간환경시스템',
    ));
    hakbu.add(new DropdownMenuItem(
      child: new Text('전산전자',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'전산전자',
    ));
    hakbu.add(new DropdownMenuItem(
      child: new Text('콘텐츠융합디자인',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'콘텐츠융합디자인',
    ));
    hakbu.add(new DropdownMenuItem(
      child: new Text('기계제어',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'기계제어',
    ));
    hakbu.add(new DropdownMenuItem(
      child: new Text('ICT창업',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'ICT창업',
    ));
    hakbu.add(new DropdownMenuItem(
      child: new Text('창의융합',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'창의융합',
    ));
  }

  void loadLocation(){
    location = [];
    location.add(new DropdownMenuItem(
      child: new Text('서울',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'서울',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('경기',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'경기',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('인천',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'인천',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('대전',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'대전',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('세종',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'세종',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('충북',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'충북',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('충남',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'충남',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('강원',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'강원',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('광주',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'광주',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('부산',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'부산',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('대구',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'대구',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('울산',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'울산',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('전북',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'전북',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('전남',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'전남',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('경북',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'경북',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('경남',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'경남',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('제주',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'제주',
    ));
    location.add(new DropdownMenuItem(
      child: new Text('해외',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'해',
    ));
  }

  void loadHeight() {
    height = [];
    height.add(new DropdownMenuItem(
      child: new Text('150미만',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '150미만',
    ));
    height.add(new DropdownMenuItem(
      child: new Text('150 ~ 154',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '150 ~ 154',
    ));
    height.add(new DropdownMenuItem(
      child: new Text('155 ~ 159',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '155 ~ 159',
    ));
    height.add(new DropdownMenuItem(
      child: new Text('160 ~ 164',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '160 ~ 164',
    ));
    height.add(new DropdownMenuItem(
      child: new Text('165 ~ 169',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '165 ~ 169',
    ));
    height.add(new DropdownMenuItem(
      child: new Text('170 ~ 174',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '170 ~ 174',
    ));
    height.add(new DropdownMenuItem(
      child: new Text('175 ~ 179',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '175 ~ 179',
    ));
    height.add(new DropdownMenuItem(
      child: new Text('180 ~ 184',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '180 ~ 184',
    ));
    height.add(new DropdownMenuItem(
      child: new Text('185 ~ 189',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '185 ~ 189',
    ));
    height.add(new DropdownMenuItem(
      child: new Text('190이상',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '190이상',
    ));
  }

  void loadBody() {
    body = [];
    body.add(new DropdownMenuItem(
      child: new Text('마른',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '마른',
    ));
    body.add(new DropdownMenuItem(
      child: new Text('슬림',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '슬림',
    ));
    body.add(new DropdownMenuItem(
      child: new Text('보통',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '보통',
    ));
    body.add(new DropdownMenuItem(
      child: new Text('통통',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '통통',
    ));
    body.add(new DropdownMenuItem(
      child: new Text('글래머',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '글래머',
    ));
    body.add(new DropdownMenuItem(
      child: new Text('근육질',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '근육질',
    ));
  }

  void loadBtype() {
    btype = [];
    btype.add(new DropdownMenuItem(
      child: new Text('A',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: 'A',
    ));
    btype.add(new DropdownMenuItem(
      child: new Text('B',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: 'B',
    ));
    btype.add(new DropdownMenuItem(
      child: new Text('O',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: 'O',
    ));
    btype.add(new DropdownMenuItem(
      child: new Text('AB',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: 'AB',
    ));
  }

  void loadCharac() {
    charac = [];
    charac.add(new DropdownMenuItem(
      child: new Text('친절함',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '친절함',
    ));
    charac.add(new DropdownMenuItem(
      child: new Text('착함',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '착함',
    ));
    charac.add(new DropdownMenuItem(
      child: new Text('유머러스함',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '유머러스함',
    ));
    charac.add(new DropdownMenuItem(
      child: new Text('지적임',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '지적임',
    ));
    charac.add(new DropdownMenuItem(
      child: new Text('꼼꼼함',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '꼼꼼함',
    ));
    charac.add(new DropdownMenuItem(
      child: new Text('낙관적',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '낙관적',
    ));
    charac.add(new DropdownMenuItem(
      child: new Text('외향적',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '외향적',
    ));
    charac.add(new DropdownMenuItem(
      child: new Text('자상함',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '자상함',
    ));
    charac.add(new DropdownMenuItem(
      child: new Text('듬직함',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '듬직함',
    ));
    charac.add(new DropdownMenuItem(
      child: new Text('감성적',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '감성적',
    ));
    charac.add(new DropdownMenuItem(
      child: new Text('열정적',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '열정적',
    ));
    charac.add(new DropdownMenuItem(
      child: new Text('부끄러움이 많음',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '부끄러움이 많음',
    ));
  }

  void loadSmoke() {
    smoke = [];
    smoke.add(new DropdownMenuItem(
      child: new Text('안함',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '안함',
    ));
    smoke.add(new DropdownMenuItem(
      child: new Text('자주',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '자주',
    ));
    smoke.add(new DropdownMenuItem(
      child: new Text('가끔',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value: '가끔',
    ));
  }

  void loadDrink(){
    drink = [];
    drink.add(new DropdownMenuItem(
      child: new Text('안함',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'안함',
    ));
    drink.add(new DropdownMenuItem(
      child: new Text('자주',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'자주',
    ));
    drink.add(new DropdownMenuItem(
      child: new Text('가끔',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'가끔',
    ));
  }

  void loadReligion(){
    religion = [];
    religion.add(new DropdownMenuItem(
      child: new Text('무교',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'무교',
    ));
    religion.add(new DropdownMenuItem(
      child: new Text('기독교',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'기독교',
    ));
    religion.add(new DropdownMenuItem(
      child: new Text('불교',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'불교',
    ));
    religion.add(new DropdownMenuItem(
      child: new Text('천주교',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'천주교',
    ));
    religion.add(new DropdownMenuItem(
      child: new Text('이슬람교',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'이슬람교',
    ));
    religion.add(new DropdownMenuItem(
      child: new Text('기타',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'기타',
    ));
  }

  void loadNationality(){
    nationality = [];
    nationality.add(new DropdownMenuItem(
      child: new Text('대한민국',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'대한민국',
    ));
    nationality.add(new DropdownMenuItem(
      child: new Text('미국',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'미국',
    ));
    nationality.add(new DropdownMenuItem(
      child: new Text('중국',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'중국',
    ));
    nationality.add(new DropdownMenuItem(
      child: new Text('일본',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'일본',
    ));
    nationality.add(new DropdownMenuItem(
      child: new Text('기타',
        style: TextStyle(
            fontSize:17.0,
            color: const Color(0xFFf26597),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"
        ),
      ),
      value:'기',
    ));
  }

  @override
  Widget build(BuildContext context) {
    loadImg();
    loadGender();
    loadHakbu();
    loadAge();
    loadNationality();
    loadLocation();
    loadHeight();
    loadBody();
    loadBtype();
    loadCharac();
    loadSmoke();
    loadDrink();
    loadReligion();

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('정보수정',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        body:
        Padding(
            padding: EdgeInsets.all(20.0),
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(13.0)),
                                    Text(
                                      "사진등록",
                                      style: new TextStyle(fontSize:17.0,
                                          color: const Color(0xFF000000),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Roboto"
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(8.0)),
                                    stackf(),
                                    Padding(padding: EdgeInsets.all(5.0)),
                                  ]
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(7.0)),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      //Text('----------------------------------------------------------------------------------------------'),
                                      Padding(padding: EdgeInsets.all(7.0)),
                                      Text("   이름(닉네임)",
                                          style: new TextStyle(fontSize:17.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto"
                                          )
                                      ),
                                      Padding(padding: EdgeInsets.all(12.0)),
                                      Text("   성별",
                                          style: new TextStyle(fontSize:17.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto"
                                          )
                                      ),
                                      Padding(padding: EdgeInsets.all(12.0)),
                                      Text("   학부",
                                          style: new TextStyle(fontSize:17.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto"
                                          )
                                      ),
                                      Padding(padding: EdgeInsets.all(12.0)),
                                      Text("   나이",
                                          style: new TextStyle(fontSize:17.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto"
                                          )
                                      ),
                                      Padding(padding: EdgeInsets.all(12.0)),
                                      Text("   국적",
                                          style: new TextStyle(fontSize:17.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto"
                                          )
                                      ),
                                      Padding(padding: EdgeInsets.all(12.0)),
                                      Text("   지역",
                                          style: new TextStyle(fontSize:17.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto"
                                          )
                                      ),
                                      Padding(padding: EdgeInsets.all(24.0)),
                                      //Text('----------------------------------------------------------------------------------------------'),
                                      Padding(padding: EdgeInsets.all(7.0)),
                                      Text("   키",
                                          style: new TextStyle(fontSize:17.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto"
                                          )
                                      ),
                                      Padding(padding: EdgeInsets.all(12.0)),
                                      Text("   체형",
                                          style: new TextStyle(fontSize:17.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto"
                                          )
                                      ),
                                      Padding(padding: EdgeInsets.all(24.0)),
                                      //Text('----------------------------------------------------------------------------------------------'),
                                      Padding(padding: EdgeInsets.all(7.0)),
                                      Text("   혈액형",
                                          style: new TextStyle(fontSize:17.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto"
                                          )
                                      ),
                                      Padding(padding: EdgeInsets.all(12.0)),
                                      Text("   성격",
                                          style: new TextStyle(fontSize:17.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto"
                                          )
                                      ),
                                      Padding(padding: EdgeInsets.all(24.0)),
                                      //Text('----------------------------------------------------------------------------------------------'),
                                      Padding(padding: EdgeInsets.all(7.0)),
                                      Text("   흡연여부/정도",
                                          style: new TextStyle(fontSize:17.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto"
                                          )
                                      ),
                                      Padding(padding: EdgeInsets.all(12.0)),
                                      Text("   음주여부/정도",
                                          style: new TextStyle(fontSize:17.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto"
                                          )
                                      ),
                                      Padding(padding: EdgeInsets.all(12.0)),
                                      Text("   종교",
                                          style: new TextStyle(fontSize:17.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto"
                                          )
                                      ),
                                      Padding(padding: EdgeInsets.all(24.0)),
                                      //Text('----------------------------------------------------------------------------------------------'),
                                      Padding(padding: EdgeInsets.all(7.0)),
                                      Text("   자기소개",
                                          style: new TextStyle(fontSize:17.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto"
                                          )
                                      ),
                                      Padding(padding: EdgeInsets.all(12.0)),
                                      Text("   카카오ID",
                                          style: new TextStyle(fontSize:17.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto"
                                          )
                                      ),
                                      Padding(padding: EdgeInsets.all(50.0)),
                                    ]
                                ),
                                Container(
                                    child: Flexible(
                                        fit: FlexFit.loose,
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Padding(padding: EdgeInsets.all(2.0)),
                                              Container(
                                                width: 130,
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize:17.0,
                                                      color: const Color(0xFFf26597),
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: "Roboto"
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(hintText: '입력'),
                                                  onChanged: (String str){
                                                    setState(() => name1 = str);
                                                  },
                                                ),
                                              ),
                                              DropdownButton(
                                                  value: gender1,
                                                  items: gender,
                                                  onChanged: (value) {
                                                    gender1=value;
                                                    setState((){});
                                                  }
                                              ),
                                              DropdownButton(
                                                  value: hakbu1,
                                                  items: hakbu,
                                                  onChanged: (value) {
                                                    hakbu1=value;
                                                    setState((){});
                                                  }
                                              ),
                                              DropdownButton(
                                                  value: age1,
                                                  items: age,
                                                  onChanged: (value) {
                                                    age1=value;
                                                    setState((){});
                                                  }
                                              ),
                                              DropdownButton(
                                                  value: nationality1,
                                                  items: nationality,
                                                  onChanged: (value) {
                                                    nationality1=value;
                                                    setState((){});
                                                  }
                                              ),
                                              DropdownButton(
                                                  value: location1,
                                                  items: location,
                                                  onChanged: (value) {
                                                    location1=value;
                                                    setState((){});
                                                  }
                                              ),
                                              Padding(padding: EdgeInsets.all(20.0)),
                                              DropdownButton(
                                                  value: height1,
                                                  items: height,
                                                  onChanged: (value) {
                                                    height1=value;
                                                    setState((){});
                                                  }
                                              ),
                                              DropdownButton(
                                                  value: body1,
                                                  items: body,
                                                  onChanged: (value) {
                                                    body1=value;
                                                    setState((){});
                                                  }
                                              ),
                                              Padding(padding: EdgeInsets.all(20.0)),
                                              DropdownButton(
                                                  value: btype1,
                                                  items: btype,
                                                  onChanged: (value) {
                                                    btype1=value;
                                                    setState((){});
                                                  }
                                              ),
                                              DropdownButton(
                                                  value: charac1,
                                                  items: charac,
                                                  onChanged: (value) {
                                                    charac1=value;
                                                    setState((){});
                                                  }
                                              ),
                                              Padding(padding: EdgeInsets.all(20.0)),
                                              DropdownButton(
                                                  value: smoke1,
                                                  items: smoke,
                                                  onChanged: (value) {
                                                    smoke1=value;
                                                    setState((){});
                                                  }
                                              ),
                                              DropdownButton(
                                                  value: drink1,
                                                  items: drink,
                                                  onChanged: (value) {
                                                    drink1=value;
                                                    setState((){});
                                                    print(drink1);
                                                  }
                                              ),
                                              DropdownButton(
                                                  value: religion1,
                                                  items: religion,
                                                  onChanged: (value) {


                                                    setState((){
                                                      religion1=value;
                                                    });
                                                  }
                                              ),
                                              Padding(padding: EdgeInsets.all(15.0)),
                                              Container(
                                                width: 400,
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize:17.0,
                                                      color: const Color(0xFFf26597),
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: "Roboto"
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(hintText: '입력'),
                                                  onChanged: (String str){
                                                    setState(() => intro1 = str);
                                                  },
                                                ),
                                              ),
                                              Padding(padding: EdgeInsets.all(4.0)),
                                              Container(
                                                width: 400,
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize:17.0,
                                                      color: const Color(0xFFf26597),
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: "Roboto"
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(hintText: '입력'),
                                                  onChanged: (String str){
                                                    setState(() => kakaoid1 = str);
                                                  },
                                                ),
                                              ),
                                              Padding(padding: EdgeInsets.all(2.0)),
                                              Text("상대와 연결되면, 서로의 카카오ID가 교환됩니다.",
                                                  style: new TextStyle(fontSize:12.5,
                                                      fontFamily: "Roboto"
                                                  )
                                              ),
                                            ]
                                        )
                                    )
                                )
                              ]
                          ),
                          Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                IconButton(
                                  onPressed:(){

                                    Firestore.instance.collection('users').document(widget.user.email.split('@')[0]).setData({
                                      'hakbun' : widget.user.email.split('@')[0],
                                      'name' : name1,
                                      'age' : age1,
                                      'hakbu' : hakbu1,
                                      'nation' : nationality1,
                                      'location' : location1 ,
                                      'height' : height1,
                                      'body' : body1,
                                      'bloodtype' : btype1 ,
                                      'character' : charac1,
                                      'smoke' : smoke1,
                                      'drink' : drink1,
                                      'religion' : religion1,
                                      'intro' : intro1,
                                      'kakaoid' : kakaoid1,
                                    });

                                    final firebaseStorageRef = FirebaseStorage.instance
                                        .ref()
                                        .child('profile') //폴더
                                        .child('${DateTime.now().millisecondsSinceEpoch}.png');

                                    final  task = firebaseStorageRef.putFile(
                                        imageFile, StorageMetadata(contentType: 'image/png')
                                    );

                                    task.onComplete.then(
                                            (value) {var downloadUrl = value.ref.getDownloadURL();
                                        downloadUrl.then((uri) {
                                          var doc = Firestore.instance.collection('profile').document();
                                          doc.setData({
                                            'id' : doc.documentID,
                                            'hakbun' : widget.user.email.split('@')[0],
                                            'photoURL' : uri.toString(),
                                            'name' : widget.user.displayName,
                                            'userPhoto' : widget.user.photoUrl
                                          }).then((onValue) {
                                            Navigator.pushReplacement(context, MaterialPageRoute(
                                                builder:  (context) => matchPage(widget.user)));//then
                                          });
                                        });
                                        }
                                    );
                                  },
                                  splashColor: const Color(0xFFfba4c2),
                                  icon: Icon(
                                    Icons.favorite, color: const Color(0xFFfba4c2),
                                  ),
                                  iconSize: 90.0,
                                ),
                                Text(
                                  '완료',
                                  style: TextStyle(
                                      fontSize:17.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Roboto"
                                  ),
                                ),
                              ]
                          )
                        ]
                    )
                ))
        )
    );
  }

  Widget stacknum(){
    return Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(18.0)),
          stackf()
        ]
    );
  }

  Widget stackf(){
    return Stack(
        children: <Widget>[
          SizedBox(
            width: 120.0,
            height: 120.0,
            child:  imageFile == null? loadImg() : Image.file(imageFile),

          ),
          Container(
              width: 120.0,
              height: 120.0,
              alignment: Alignment.bottomRight,
              child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
//                    SizedBox(
//                        width: 28.0,
//                        height: 28.0,
//                        child: FloatingActionButton(
//                          heroTag: 'btn1',
//                          onPressed: (){
//                          },
//                          backgroundColor: Colors.white,
//                        )
//                    ),
                    SizedBox(
                        width: 35.0,
                        height: 35.0,
                        child: FloatingActionButton(
                          heroTag: 'btn2',
                          onPressed: (){
                            getImg();
                          },//이거 눌리면 사진추가!
                          backgroundColor: const Color(0xFFf26597),
                          child: Icon(Icons.add),
                        )
                    ),
                  ]
              )
          )
        ]
    );
  }


}
