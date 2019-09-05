import 'package:flutter/material.dart';

//지수가 만든 경축 페이지

class Congratulation extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: const Color(0xFFfd9dbd),
        ),
        home: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title:
                Text('CONGRATULATIONS!',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
            ),
            body: Center(
                child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(40)),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.favorite,size: 10, color: const Color(0xFFfd9dbd),),
                            Padding(padding: EdgeInsets.all(8)),
                            Text('미노',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                            Text('님과',style: TextStyle(fontSize: 25)),
                            Padding(padding: EdgeInsets.all(8)),
                            Icon(Icons.favorite,size: 10, color: const Color(0xFFfd9dbd),),
                          ]
                      ),
                      Text('연결되었습니다',style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: const Color(0xFFfd9dbd))),

                      Padding(padding: EdgeInsets.all(10.0)),
                      SizedBox(
                        width: 340,
                        height: 220,
                        child: Card(
                          //사진 + icons + 사진
                              child: Column(
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.all(10)),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Column(//여자
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              SizedBox(
                                                  width:120,
                                                  height:120,
                                                  child: CircleAvatar(
                                                      backgroundImage: NetworkImage('http://img.hani.co.kr/imgdb/resize/2018/0518/00502318_20180518.JPG')
                                                  )
                                              ),
                                              Padding(padding: EdgeInsets.all(3.0)),
                                              Text('20'+'세',style: TextStyle(fontSize: 15)),
                                              Text('글로벌리더십'+'학부',style: TextStyle(fontSize: 15)),
                                            ]
                                        ),
                                        Padding(padding: EdgeInsets.all(8.0)),
                                        Icon(Icons.favorite,size: 30, color: const Color(0xFFfd9dbd),),
                                        Padding(padding: EdgeInsets.all(8.0)),
                                        Column(//남자
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              SizedBox(
                                                  width:120,
                                                  height:120,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage('http://img.hani.co.kr/imgdb/resize/2014/0201/139114607628_20140201.JPG'),
                                                  )
                                              ),
                                              Padding(padding: EdgeInsets.all(3.0)),
                                              Text('24'+'세',style: TextStyle(fontSize: 15)),
                                              Text('전산전자'+'학부',style: TextStyle(fontSize: 15)),
                                            ]
                                        ),
                                      ]
                                  ),
                                  Padding(padding: EdgeInsets.all(5)),
                                ],
                              ),

                        ),
                      ),
                      Padding(padding: EdgeInsets.all(18.0)),
                      Text('먼저 용기내어 선톡해보는건 어떨까요? :)', style: TextStyle(fontSize: 14),),
                      Padding(padding: EdgeInsets.all(7.0)),
                      Text('카톡ID : '+'amyjjang',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ]
                ))
        )
    );
  }
}

