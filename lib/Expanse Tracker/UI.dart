import 'package:flutter/material.dart';

class expanse extends StatefulWidget {
  const expanse({super.key});

  @override
  State<expanse> createState() => _expanseState();
}

class _expanseState extends State<expanse> {
  final List<String> categoryList = ['food', 'transport' , 'bills'];
  void showFrom (){
    String selectedValue = '';
    showModalBottomSheet(context: context, builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(
                )
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                  labelText: "Amount",
                  border: OutlineInputBorder(
                  )
              ),
            ),
            SizedBox(height: 10,),
            DropdownButtonFormField(items: categoryList.map((e)=> DropdownMenuItem(value:  categoryList, child: Text("Category"))).toList(), onChanged: (value) {
              selectedValue = value! as String;
            },)

          ],
        ),
      );
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [IconButton(onPressed: (){setState(() {
          showFrom();
        });}, icon:Icon(Icons.add))],
      ),
    );
  }
}
