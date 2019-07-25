import 'package:flutter/material.dart';

class Congratulation extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: const Color(0xFFffdbf8),
        ),
        home: Scaffold(
            appBar: AppBar(
            ),
            body: Center(
                child: Column(
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.face,size: 50),
                            Text('경축',style: TextStyle(fontSize: 50)),
                            Icon(Icons.face,size: 50)
                          ]
                      ),
                      Padding(padding: EdgeInsets.all(8.0)),
                      SizedBox(
                        width: 240.0,
                        height: 240.0,
                        child: Card(
                          //사진 + icons + 사진
                            child: Center(
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
                                    Icon(Icons.favorite,size: 50),
                                    SizedBox(
                                        width:80.0,
                                        height:80.0,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage('http://img.hani.co.kr/imgdb/resize/2014/0201/139114607628_20140201.JPG'),
                                        )
                                    )
                                  ]
                              ),
                            )
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8.0)),
                      Text('연결되었습니다.'),
                      Padding(padding: EdgeInsets.all(8.0)),
                      Text('상대방 카톡 아이디 : '+'~~',style: TextStyle(fontWeight: FontWeight.bold)),
                    ]
                ))
        )
    );
  }
}