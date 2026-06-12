import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {

  void _showTaskDialog({int ?index}){
    TextEditingController _TaskController = TextEditingController();
    showDialog(context: context, builder: (context) => AlertDialog(
      content: TextField(
        controller: _TaskController,
        decoration: InputDecoration(
          hintText: "Enter Task"
        ),
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("cancel",style: TextStyle(color: Colors.red),)),
        ElevatedButton(onPressed: (){
          if(_TaskController.text.trim().isNotEmpty){
            addTask(_TaskController.text);
          }
        }, child: Text("save"),style: ElevatedButton.styleFrom(backgroundColor: Colors.teal))
      ],
    ),);
  }

  bool showActiveTask = true;
  List<Map<String, dynamic>> tasks = [];
  void addTask(String task){
    setState(() {
      tasks.add({
        'task' : task,
        'Complete' : false,
      });
      Navigator.pop(context);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      title: Text("TO_DO",style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.teal,),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.teal,onPressed: ()=>_showTaskDialog(),child: Icon(Icons.add,color: Colors.white,),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  color: Colors.orange,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      Text("10", style: TextStyle(fontSize: 30,color: Colors.white),),
                      SizedBox(height: 10,),
                      Text("Active Task",style: TextStyle(color: Colors.white),)
                    ],),
                  )
                ),
                Card(
                    color: Colors.teal,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: [
                        Text("10", style: TextStyle(fontSize: 30,color: Colors.white),),
                        SizedBox(height: 10,),
                        Text("Complete Task",style: TextStyle(color: Colors.white),)
                      ],),
                    )
                )
              ],
            ),
            SizedBox(height: 20,),

            Divider(),
            Text("Tasks", style: TextStyle(color: Colors.teal,fontSize: 25,fontWeight: FontWeight.w800),),
            Expanded(child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
             var  item = tasks[index];
             return Card(
               color: Colors.teal[100],
             child: ListTile(
               title: Text(item['task'], style: TextStyle(color: Colors.black),),
               leading: Card(color: Colors.teal,
               child: SizedBox(height: 30, width: 30,),),
             ),
             );

            },))
          ],
        ),
      ),
    );
  }
}
