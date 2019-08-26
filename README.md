# Firebase database Getting started

gbc project

# database 정리

데이터 추가
 ```
final QuerySnapshot result = await Firestore.instance
.collection('users')
.where('id', isEqualTo: user.uid)
.getDocuments();

// 위의 내용이 users라는 collection에서 id 카테고리에 user.uid를 불러오는것

final List<DocumentSnapshot> documents = result.documents;

if(documents.length == 0){ // 길이가 0이면 기본세팅
Firestore.instance.collection('users').document(user.uid).setData({ //documnet(문서이름)
'hakbun' : user.email.split('@')[0],
'name' : user.displayName
});
 ```
데이터 업데이트

  ```
  Firestore.instance.collection('users').document('1000000').setData({
                          'hakbun' : 'working',
                          'name' : 'working'
                        });
 ```
 
 


database가 아닌 cloud firebase(사진업로드할 때 썻던것)를 통합해서 이용하기로함.




  

유의점 :

firebase database는 전체 데이터 개수를 세지 않기때문에 알려면 별도의 데이터에 저장해야함

ex) 랜덤으로 불러오기위해 전체 유저수를 알아야할때 : 유저를 추가할때마다 usercount라는 데이터에 1씩 더해주는 방식

**데이터 가져오는것도 streambuilder의 스냅샷을 이용하면 된다. ex)**

  ```
  return new StreamBuilder<QuerySnapshot>(
  stream: Firestore.instance.collection('hakbun').snapshots(), // hakbun 폴더 가져오기
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (!snapshot.hasData) returnCenter(child: CircularProgressIndicator(),); //데이터없으면 로딩
    
    //implement code here :
    
    return  ListView(  //이 예제는 그냥 데이터 가져와서 리스트뷰만드는 코드
      children: snapshot.data.documents.map((DocumentSnapshot document) {
        return  ListTile(
          title:  Text(document['name']),
          subtitle:  Text(document['phone']),
        );
      }).toList(),
    );
  },
);
  ```
=======
>>>>>>> a8113126b984d7201fd33b4f9caf8816bb653859


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
