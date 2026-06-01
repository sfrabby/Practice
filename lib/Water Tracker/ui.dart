import 'package:flutter/material.dart';

import 'Widget/addWater.dart';

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
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          "water Tank",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 17),
            Container(
              alignment: Alignment.center,
              height: 180,
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.water_drop, color: Colors.deepPurpleAccent, size: 50),
                  Text(
                    "3000 LTR",
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurpleAccent.withOpacity(0.3), // নীল রঙের হালকা ছায়া
                    blurRadius: 5.0, // কম ঝাপসা
                    spreadRadius: 1.0, // কম ছড়ানো
                    offset: Offset(-2.0, -2.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    backgroundColor: Colors.grey[400],
                    color: Colors.deepPurpleAccent,
                    value: 0.3,
                  ),
                ),
                Text(
                  "30%",
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Wrap(
              children: [
                ButtonAdd(OnTap: () {  }, text: '200',),
                ButtonAdd(OnTap: () {  }, text: '400',),
                ButtonAdd(OnTap: () {  }, text: '800',),
                ButtonAdd(OnTap: () {  }, text: '1600',)
              ],
            ),
          ],
        ),
      ),
    );
  }
}


