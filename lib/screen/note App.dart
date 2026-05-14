import 'package:flutter/material.dart';

class noteApp extends StatefulWidget {
   noteApp({super.key});

  @override
  State<noteApp> createState() => _noteAppState();
}

class _noteAppState extends State<noteApp> {
  TextEditingController taskController = TextEditingController();

  List<String> taskList = [];

  void taskAdd(){
    if(taskController.text.isNotEmpty){
      setState(() {
        taskList.add(taskController.text);
        taskController.clear();
      });
    }
  }
  void deleteTask(int index){
    setState(() {
      taskList.removeAt(index);
    });

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("To-DO app", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField(
                  controller: taskController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(

                    )
                  ),
                )),
                Expanded(child: ElevatedButton(onPressed: (){}, child: Text("Add ")))
              ],
            )
          ],
        ),
      ),
    );
  }
}
