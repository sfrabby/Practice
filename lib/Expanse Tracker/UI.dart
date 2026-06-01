import 'package:flutter/material.dart';

class expanse extends StatefulWidget {
  const expanse({super.key});

  @override
  State<expanse> createState() => _expanseState();
}

class _expanseState extends State<expanse> {
  void showFrom (){
    showModalBottomSheet(context: context, builder: (context) {
      return Column(
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
                labelText: "Title",
                border: OutlineInputBorder(
                )
            ),
          ),

        ],
      );
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
    );
  }
}
