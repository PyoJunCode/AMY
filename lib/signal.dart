import 'package:flutter/material.dart';
import 'package:flutter_app/congr.dart';

class messageAll extends StatefulWidget {
  @override
  _messageAllState createState() => _messageAllState();
}

class _messageAllState extends State<messageAll> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('마음 저장소',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
        ),
        body: _buildBody(context)
    );
  }
}

Widget _buildBody(BuildContext context) {
  return Scaffold(
    body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SafeArea(child: SingleChildScrollView(
            child: Center(
                child: Column(
                    children: <Widget>[
                      _plusmessage (context)//쪽지 올 때마다 추가
                    ]
                )
            )
        ))
    ),
  );
}

Widget _plusmessage (BuildContext context){
  return SizedBox(
      width: 400.0,
      height: 100.0,
      child: Card(
          child: Center(
            child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        width:80.0,
                        height:80.0,
                        child: CircleAvatar(
                            backgroundImage: NetworkImage('http://img.hani.co.kr/imgdb/resize/2018/0518/00502318_20180518.JPG')
                        )
                    ),
                    //버튼 + 버튼 + 버튼
                    Padding(padding: EdgeInsets.all(4.0)),
                    Container(
                      child: Flexible(
                        fit: FlexFit.loose,
                        child: RaisedButton(
                          child: Text('더 보기'),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>Congratulation())); //상세정보화면
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Flexible(
                        fit: FlexFit.loose,
                        child: RaisedButton(
                          child: Text('수락'),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>Congratulation())); //con화면
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Flexible(
                        fit: FlexFit.loose,
                        child: RaisedButton(
                          child: Text('삭제'),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>Congratulation())); //거절시 삭제
                          },
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(4.0))
                  ]
              ),
            ),
          )
      )
  );
}