import 'package:flutter/material.dart';
import 'package:flutter_app/signal.dart';
import 'match.dart';
import 'menuConsts.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'myinfo.dart';


class frontPage extends StatefulWidget {

  final FirebaseUser user;

  frontPage(this.user);


  @override
  _frontPageState createState() => _frontPageState();
}

class _frontPageState extends State<frontPage> {
  int menu_select = 0;

  List pages;

  @override
    void initState() {
    // TODO: implement initState
    super.initState();
    pages = [
      matchPage(widget.user),
      messageAll(),
      myInfoPage(),

    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[menu_select],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeMenu,
          currentIndex: menu_select,
          items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.photo_camera), title: Text('Matching')),
        BottomNavigationBarItem(icon: Icon(Icons.signal_wifi_4_bar), title: Text('Signal')),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('My Info')),
      ]),
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

}
