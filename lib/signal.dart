import 'package:flutter/material.dart';
import 'package:flutter_app/congr.dart';


class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {

  List<Card> _todoItems = [];

  Widget _buildToDoList() {
    return new ListView.builder(
        itemBuilder: (context, index) {
          if(index < _todoItems.length) {
            return _buildToDoItem(_todoItems[index], index);
          }
        }
    );
  }

  Widget _buildToDoItem(Card todoText, int index) {
    return new ListTile(
      title: todoText,
      onTap: () => _promptRemoveTodoItem(index),
    );
  }

  _addTodoItem(Card item) {
    setState(() {
      _todoItems.add(item);
    });
  }

  _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text('완료 처리 하시겠습니까?'),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("정보",style: TextStyle(color: Colors.black)),
                  onPressed: ()  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Congratulation())); //con화면

                  },
                ),
                new FlatButton(
                  child: new Text('수락',style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Congratulation()));
                  },
                ),
                new FlatButton(
                    child: new Text('삭제',style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    }
                )
              ]
          );
        }
    );
  }

  _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  _navigatorAddItemScreen() async {

    _addTodoItem(Card(
        child: Center(child:SizedBox(
            width:80.0,
            height:80.0,
            child: CircleAvatar(
                backgroundImage: NetworkImage('http://img.hani.co.kr/imgdb/resize/2018/0518/00502318_20180518.JPG')
            )
        ),
        )));

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('저장소')
      ),
      body: _buildToDoList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _navigatorAddItemScreen,
          tooltip: '추가',
          child: new Icon(Icons.add)
      ),
    );
  }
}