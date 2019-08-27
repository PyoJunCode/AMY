# Firebase database Getting started

gbc project

# database 정리

*데이터 불러오기*



1.

 ```
final QuerySnapshot result = await Firestore.instance
.collection('users')
.where('id', isEqualTo: user.uid) // 2번에도 적용가능. where 으로 특정 필드값에 만족하는 항목 가져올수있음.
.getDocuments();

final List<DocumentSnapshot> documents = result.documents;

 ```
 
 만약 gender가 male인 document들만 불러오고 싶다? 그럼
 
 ...where('gender' isEqualTo: 'male')... 으로 불러와서 documents[index]['name'] 이런식으로 필요한 정보 빼서 쓰면 됨.
 
 하지만 총 남자수는 계산 안해주므로 파이어 베이스에 따로 숫자카운트해서 저장해놓은거 불러와야 할듯.
 
 *데이터 저장 형식*
 유저정보 :
 
 ![img](https://user-images.githubusercontent.com/47979730/63790788-01134300-c935-11e9-9802-fab0697b2ddd.png)
 
 2.
 
  ```
 
 StreamBuilder(
 
 stream: Firestore.instance.collection('users').snapshots(),
 builder: (BuildContext context, AsyncSnapshot snapshot) {
 if(!snapshot.hasData) {
 return Center(child: CircularProgressIndicator(),);
 } //로딩
 
 return Text(snapshot.data.documents[1]['name']); //가져온 user도큐먼트 1번째의 name출력
 
 },
 );
 
  ```
 
실시간 변동이 있을 때에는 2번을 추천

데이터 추가하기


 ```


Firestore.instance.collection('users').document(user.uid).setData({ //documnet(문서이름)
'hakbun' : user.email.split('@')[0],
'name' : user.displayName

 ```
collection(폴더명) , documnet( 파일명) 여기서 파일명은 기본적으로 학번으로 한다. ==> 학번 추출방법 : 로그인처럼 user를 전달받고

user.email.split('@')[0] 을 쓰면 학번짜를 수 있음.

statueful 화면이라면 widget.user.email ...으로 써야함

데이터 업데이트

  ```
  Firestore.instance.collection('users').document('1000000').updateData({
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
