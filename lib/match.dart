import 'package:flutter/material.dart';
import 'dart:math';
import 'detail.dart';
import 'menuConsts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/login.dart';


class matchPage extends StatefulWidget {

  final FirebaseUser user;

  matchPage(this.user);


  @override
  _matchState createState() => _matchState();
}

class _matchState extends State<matchPage> {
  int menu_select = 0;
  static int clicked = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: buildAppBar(),
      body: buildBody(),

    );
  }

  void changeMenu(int menu_index) {
    setState(() {
      menu_select = menu_index;
    });
  }

  buildAppBar() {

    return AppBar(
      centerTitle: true,
      title: Text('Han Man Chu~🥰', style: TextStyle(color: Colors.white)),

      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: menuChoise,
          itemBuilder: (BuildContext context) {
            return menuConsts.choices.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice, style: TextStyle(color: Colors.deepPurpleAccent),),
              );
            }).toList();
          },
          icon: Icon(Icons.library_add, color: Colors.black,),
          offset: Offset(0,40),

        )
      ],
    );
  }

  menuChoise(String choise) {
    if(choise == menuConsts.major){

    }
  }

  buildBody() {
    String url = 'http://support.handong.edu/photo/217/21700566.jpg';
    Random rnd;
    int min = 000;
    int max = 800;
    rnd = new Random();
    int r = min + rnd.nextInt(max-min);

    String stunum = r.toString();

    if(stunum.length == 2) stunum = '0' + stunum;
    else if(stunum.length == 1) stunum = '00' + stunum;


    String murl = url + r.toString() + '.jpg';


    return Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Container(


            alignment: AlignmentDirectional.center,

            child: Center(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[


                  Padding(padding: EdgeInsets.all(10),),

                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: <Widget>[

                        Text('마음에 드는 이성을 찾아보세요 !',
                            style: TextStyle(fontSize: 20)),
                        Padding(padding: EdgeInsets.all(8)),
                        SizedBox(

                          width: 250,
                          child: Card(

                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                    width: 180,
                                    height: 180,
                                    child: Image.network(url)
                                ),
                                Text(clicked.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('학부 : Ghost'),
                                Padding(padding: EdgeInsets.all(8)),
                                Container(
                                  child: Column(
                                    children: <Widget> [
                                        IconButton(icon: Icon(Icons.send,
                                          size: 40,
                                        ),
                                          onPressed: () {
                                          //sendM(context);


                                          },
                                        ),

                                      Text('친해져요!'),
                                    ], //column widget
                                  ),
                                ),
                              ],

                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(

                      child: Flexible(
                          fit: FlexFit.loose,
                          child: IconButton(icon: Icon(Icons.navigate_next, size: 60,),
                            onPressed: () {
                            clicked ++;
                            buildBody();
                            },),

                      )

                  ),

                ],

              ),
            ),

          ),

        )
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

