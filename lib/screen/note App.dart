import 'package:flutter/material.dart';

class noteApp extends StatefulWidget {
  noteApp({super.key});

  @override
  State<noteApp> createState() => _noteAppState();
}

class _noteAppState extends State<noteApp> {
  TextEditingController taskController = TextEditingController();

  List<String> taskList = [];

  void taskAdd() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        taskList.add(taskController.text);
        taskController.clear();
      });
    }
  }

  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To-do app",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width:
                      150, // বাটনের উইডথ একটু বাড়িয়ে দিলাম যাতে দেখতে ভালো লাগে
                  height: 50, // একটি স্ট্যান্ডার্ড উচ্চতা যোগ করা হলো
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .teal, // আপনার অ্যাপবারের সাথে মিল রেখে টিল কালার
                      foregroundColor: Colors.white, // টেক্সট কালার সাদা
                      elevation: 5, // বাটনের নিচে হালকা শ্যাডো
                      shadowColor: Colors.teal.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // বর্ডার একটু রাউন্ডেড করা হলো
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    onPressed: () {
                      taskAdd();
                    },
                    child: const Text("ADD TASK"),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: taskList.length,
              reverse: true,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(taskList[index]),
                    subtitle: Text(
                      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ",
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        deleteTask(index);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
