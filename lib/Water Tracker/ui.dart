import 'package:flutter/material.dart';

class waterTank extends StatefulWidget {
  const waterTank({super.key});

  @override
  State<waterTank> createState() => _waterTankState();
}

class _waterTankState extends State<waterTank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("water Tank", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 180,
              width: 250,
              child: Text("3000 LTR", style: TextStyle(color: Colors.blue ,fontSize: 25, fontWeight: FontWeight.w800),),
              decoration: BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: Colors.blue),

                ]
              ),
            ),
            

          ],

        ),
      ) ,
    );
  }
}
