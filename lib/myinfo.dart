import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/uploadtest.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class myInfoPage extends StatefulWidget {

  final FirebaseUser user;


  myInfoPage(this.user);


  @override
  _myInfoPageState createState() => _myInfoPageState();
}

class _myInfoPageState extends State<myInfoPage> {




  final textEditingController = TextEditingController();

  File imageFile; //image file



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('upload Test')),
      body: buildBody(),
    );
  }

  void getImg() async { //future의 비동기이기때문에 async랑 await쓴다.
    File image = await ImagePicker.pickImage(source: ImageSource.gallery); //Future < 비동기로 나중에 콜백

    setState(() {
      imageFile = image;
    });
  }

  buildBody() {

    var hakbun = widget.user.email.split('@')[0];

    return Center(
      child: Container(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Container(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Card(
                  child : Center(
                    child : imageFile == null? Text('No img'): Image.file(imageFile),
                  ),),

              )
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton(icon: Icon(Icons.send,
                    size: 40,
                  ),
                    onPressed: () {
                      getImg();
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.all(8),),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton(icon: Icon(Icons.cloud_upload,
                    size: 40,
                  ),
                    onPressed: () { //upload photo
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
                              'userID' : widget.user.email,
                              'photoURL' : uri.toString(),
                              'contents' : textEditingController.text,
                              'email' : widget.user.displayName,
                              'userPhoto' : widget.user.photoUrl
                            }).then((onValue) {
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder:  (context) => uploadtest(widget.user)));//then
                            });
                          });
                          }
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton(icon: Icon(Icons.file_download, size: 40),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder:  (context) => uploadtest(widget.user)));
                    },

                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton(icon: Icon(Icons.file_upload, size: 40),
                    onPressed: () {
                      final firebaseDataRef = FirebaseDatabase.instance.reference();

                      Firestore.instance.collection('users').document(widget.user.uid).updateData({
                        'hakbun' : 'update',
                        'name' : 'update2'
                      });
//
//                      Firestore.instance.collection('users').document('1000000').setData({
//                        'hakbun' : 'working',
//                        'name' : 'working'
//                      });



                    },

                  ),
                ),

              ],
            ),
          )
        ],
      ),),

    );
  }

  _buildListItem(BuildContext context, items) {

    return Image.network(
      items['photoURL'],
      fit: BoxFit.cover,
    );
  }


}


