import 'package:flutter/material.dart';



class detail extends StatelessWidget {

  final dynamic document;

  detail(this.document);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFffdbf8),
          title: Text('상세정보'),
          leading: InkWell(
            child: Icon(Icons.clear),
            onTap: (){
              print("Go back!");
              Navigator.pop(context);
            },
          )
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Container(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/image/pic1.png",
              height: 200,
              width: 180,
            ),
          ),

          Padding(padding: EdgeInsets.all(8.0)),

          Container(
            height: 250.0,
            color: Color(0xffeeeeee),
            padding: EdgeInsets.all(10.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 250.0,
              ),
              child: Scrollbar(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    reverse: true,

                    child: Column(
                      children: <Widget>[
                        Text('이름 : Amy'),
                        Text('나이 : 21살'),
                        Text('이름'),
                        Text('나이fejfefoa;ofew;fiewjfwe;'),
                        Text('전공 : 전산전자공학부'),
                        Text('이름 : Amy'),
                        Text('나이 : 21살'),
                        Text('이름'),
                        Text('나이fejfefoa;ofew;fiewjfwe;'),
                        Text('전공 : 전산전자공학부'),
                        Text('---이상형---'),
                        Text('키 : '),
                        Text('체형 : '),
                        Text('이상형'),
                        Text('이름'),
                        Text('나이'),
                        Text('전공 : 전산전자공학부'),
                        Text('이름 : Amy'),
                        Text('나이 : 21살'),
                        Text('이름'),
                        Text('나이fejfefoa;ofew;fiewjfwe;'),
                        Text('전공 : 전산전자공학부'),
                        Text('---이상형---'),
                        Text('키 : '),
                        Text('체형 : '),
                        Text('이상형'),
                        Text('이름'),
                        Text('나이'),

                      ],
                    ),
                  )
              ),
            ),
          ),

          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: (){
              _check(context);
            },
            iconSize: 48.0,
            color: Color(0xFFfb4848),
          ),
          Text('하트를 누르시면 상대방에게 호감이 전달됩니다'),
          Padding(padding: EdgeInsets.all(8.0)),

        ],
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

  }


}