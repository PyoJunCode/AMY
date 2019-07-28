# Firebase database Getting started

gbc project

# database 정리

기본형태 :
  ```
  import 'package:firebase_database/firebase_database.dart';

  final firebaseDataRef = FirebaseDatabase.instance.reference(); //파이어베이스 객체 생성 기본적으로 reference(). 뒤에붙는형식

                      firebaseDataRef.child(hakbun).update({ // reference.child(hakbun) // ==> hakbun이라는 폴더 생성
                        'email': widget.user.email, //이처럼 데이터이름, 값 쌍으로 
                        'gender': 'female',
                        'hakbun': hakbun,
                        'name': widget.user.displayName
                      });
  ```
  
**.push로 하면 결과 :**

![img](https://postfiles.pstatic.net/MjAxOTA3MjlfNTYg/MDAxNTY0MzQ1MTM4OTE3.JIJmw1-CvLRWgD2wSjPkSjMC_uKO7t_AYIk8KhxaFJ4g.smTbY5Tt6LvqkWxOPMi6AXnbpSyWmgF5affKcPEZusIg.PNG.potenpanda/SE-d91a6cf1-c510-4f7e-bc27-bb2f638112d3.png?type=w773)
  
*위의 2번째와 같이 고유의 key값 아래에 저장된다.*

(.set으로 하면 일부값만 업데이트 하면 기존데이터 없어짐. 예를들어 이름, 나이가 있는데 나이만 다시 set하면 이름없어짐.)


**.update : push,set과 달리 새로생기거나 일부값만 업데이트 가능.**


  
  
여기 참고하면 자세히 알 수 있음.
https://firebase.google.com/docs/database/admin/save-data


유의점 :

firebase database는 전체 데이터 개수를 세지 않기때문에 알려면 별도의 데이터에 저장해야함

ex) 랜덤으로 불러오기위해 전체 유저수를 알아야할때 : 유저를 추가할때마다 usercount라는 데이터에 1씩 더해주는 방식


# 이미지

기본내용은 강의참고.

  ```
  return StreamBuilder(

      stream: Firestore.instance.collection('profile').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),);
        }

        var items = snapshot.data?.documents ?? [] ; //documnets is list

          return _buildListItem(context, items[3]); //one of the List

      },
    );
  ```
  올린 사진 하나(profile 폴더의 3번째사진) 불러오기예제.  streamBuilder로 실시간 업데이트.
  
  ![img](https://postfiles.pstatic.net/MjAxOTA3MjlfOTYg/MDAxNTY0MzQ2NzI3MDMw.NrazE_dq3vUSqLBx2tOajTk1cEOlJUfZ1P3XRWB5y88g.mUU2E1_uLOYrv5I7RKLI-rgV2ew9Nu47DTITZzDwb5sg.PNG.potenpanda/SE-acfc9b08-56f2-4c7e-99f7-a95bef2ddc56.png?type=w773)

                      
                      

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
