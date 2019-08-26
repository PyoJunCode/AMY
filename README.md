# Firebase database Getting started

gbc project

# database 정리



# 이미지

기본내용은 강의참고.

  ```
  return StreamBuilder(

      stream: Firestore.instance.collection('profile').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),); //데이터없으면 로딩
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
