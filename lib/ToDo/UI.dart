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

  int get activeCount => tasks.where((task)=>!task['Complete']).length;
  int get CompletdCount => tasks.where((task)=>task['Complete']).length;
  
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
                      Text(activeCount.toString(), style: TextStyle(fontSize: 30,color: Colors.white),),
                      SizedBox(height: 6,),
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
                        Text(CompletdCount.toString(), style: TextStyle(fontSize: 30,color: Colors.white),),
                        SizedBox(height: 6,),
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
             return Dismissible(
               key: Key(UniqueKey().toString()),
               background: Container(decoration: BoxDecoration(color: Colors.green,
                   borderRadius: BorderRadius.circular(20)), child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.check_box,color: Colors.white,),
                   Text("completed", style: TextStyle(color: Colors.white),)
                 ],),),
               secondaryBackground: Container(decoration: BoxDecoration(color: Colors.red,
                   borderRadius: BorderRadius.circular(20)), child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                     Icon(Icons.delete,color: Colors.white,),
                     Text("Delete", style: TextStyle(color: Colors.white),)
               ],),),
               child: Card(
                 color: Colors.teal[100],
               child: ListTile(
                 title: Text(item['task'], style: TextStyle(color: Colors.black),),
                 leading: Card(color: Colors.teal,
                 child: SizedBox(height: 30, width: 30,),),
               ),
               ),
             );

            },))
          ],
        ),
      ),
    );
  }
}
