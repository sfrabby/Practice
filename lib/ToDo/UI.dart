import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  void _showTaskDialog({int? index}) {
    TextEditingController _TaskController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: _TaskController,
          decoration: const InputDecoration(hintText: "Enter Task"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("cancel", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              if (_TaskController.text.trim().isNotEmpty) {
                addTask(_TaskController.text);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            child: const Text("save"),
          ),
        ],
      ),
    );
  }

  bool showActiveTask = true;
  List<Map<String, dynamic>> tasks = [];

  // ১. ইনডেক্সের বদলে সরাসরি আইটেম (Map) পাস করে মেইন লিস্টের ইনডেক্স বের করা হলো
  void toggoleTaskStatus(Map<String, dynamic> item) {
    setState(() {
      int originalIndex = tasks.indexOf(item);
      if (originalIndex != -1) {
        tasks[originalIndex]['Complete'] = !tasks[originalIndex]['Complete'];
      }
    });
  }

  // ২. ডিলিট করার জন্য নতুন একটি ফাংশন যোগ করা হলো
  void deleteTask(Map<String, dynamic> item) {
    setState(() {
      tasks.remove(item);
    });
  }

  void addTask(String task) {
    setState(() {
      tasks.add({'task': task, 'Complete': false});
      Navigator.pop(context);
    });
  }

  int get activeCount => tasks.where((task) => !(task['Complete'] ?? false)).length;
  int get CompletdCount => tasks.where((task) => task['Complete'] ?? false).length;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filterTask = tasks.where((task) => (task['Complete'] ?? false) != showActiveTask).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TO_DO", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () => _showTaskDialog(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      showActiveTask = true;
                    });
                  },
                  child: Card(
                    color: showActiveTask ? Colors.orange : Colors.orange[200],
                    elevation: showActiveTask ? 10 : 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            activeCount.toString(),
                            style: const TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          const SizedBox(height: 6),
                          const Text("Active Task", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      showActiveTask = false;
                    });
                  },
                  child: Card(
                    color: !showActiveTask ? Colors.teal : Colors.teal[200],
                    elevation: !showActiveTask ? 10 : 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            CompletdCount.toString(),
                            style: const TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          const SizedBox(height: 6),
                          const Text("Complete Task", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Divider(),
            Text(
              showActiveTask ? "Active Tasks" : "Completed Tasks",
              style: const TextStyle(
                color: Colors.teal,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filterTask.length,
                itemBuilder: (context, index) {
                  var item = filterTask[index];
                  return Dismissible(
                    // ৩. UniqueKey().toString() এর বদলে আইটেমের নাম দিলে অ্যানিমেশন সুন্দর কাজ করবে
                    key: Key(item['task'] + index.toString()),
                    background: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 20),
                          Icon(Icons.check_box, color: Colors.white),
                          Text(" Completed", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    secondaryBackground: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.delete, color: Colors.white),
                          Text("Delete ", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        // ৪. এখানে সরাসরি item পাঠানো হচ্ছে
                        toggoleTaskStatus(item);
                      } else {
                        // ৫. এলস পার্টে ডিলিট ফাংশন কল করা হলো
                        deleteTask(item);
                      }
                    },
                    child: Card(
                      color: Colors.teal[100],
                      child: ListTile(
                        title: Text(
                          item['task'],
                          style: TextStyle(
                            color: Colors.black,
                            // ৬. টাস্ক কমপ্লিট হলে লেখার মাঝখানে কাটা দাগ দেখাবে
                            decoration: item['Complete'] ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        leading: Card(
                          color: item['Complete'] ? Colors.green : Colors.teal,
                          child: const SizedBox(
                            height: 30,
                            width: 30,
                            child: Icon(Icons.assignment, color: Colors.white, size: 16),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}