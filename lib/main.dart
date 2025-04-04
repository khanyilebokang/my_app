import 'package:flutter/material.dart';

class Todo{
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

List<Todo> mycustomlist = [
  Todo('Paint Town', 'Paint it Red!!!!!!! '),
  Todo('Pet the cat','Give her food'),
  Todo('Make a buger','Dont forget to get the items')
];

void main(){
  runApp( MaterialApp(title:'App',home:TodosScreen(todos:mycustomlist)));
} 

class TodosScreen extends StatelessWidget{

  const TodosScreen({Key? key,required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: ListView.builder(
      itemCount: todos.length,
        itemBuilder: (context,index){
        return ListTile(title:Text(todos[index].title),
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => DetailScreen(todo: todos[index]),
            ));
        },
        );
        })
    );
  }
}
class DetailScreen extends StatelessWidget{

const  DetailScreen({Key? key, required this.todo}): super(key:key);

final Todo todo;


@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: Text(todo.title)),
    body: Center(child: Text(todo.description),)
  );
}
}