import 'package:flutter/material.dart';

import 'Widget/button.dart';

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          "calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topRight,
              height: 250,
              width: double.infinity,
              child: Text(
                "1234",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            Row(
              children: [
                BuildButton(onClick: () {}, text: 'C', color: Colors.orangeAccent,),
                BuildButton(onClick: () {}, text: '⌫', color: Colors.orangeAccent),
                BuildButton(onClick: () {}, text: "=", color: Colors.orangeAccent),
              ],
            ),
            Row(
              children: [
                BuildButton(onClick: () {}, text: '7'),
                BuildButton(onClick: () {}, text: '8'),
                BuildButton(onClick: () {}, text: '9'),
                BuildButton(onClick: () {}, text: "/", color: Colors.orangeAccent),
              ],
            ),
            Row(
              children: [
                BuildButton(onClick: () {}, text: '4'),
                BuildButton(onClick: () {}, text: '5'),
                BuildButton(onClick: () {}, text: '6'),
                BuildButton(onClick: () {}, text: "*", color: Colors.orangeAccent),
              ],
            ),
            Row  (
              children: [
                BuildButton(onClick: () {}, text: '1'),
                BuildButton(onClick: () {}, text: '2'),
                BuildButton(onClick: () {}, text: '3'),
                BuildButton(onClick: () {}, text: "-", color: Colors.orangeAccent),
              ],
            ),
            Row(
              children: [
                BuildButton(onClick: () {}, text: '00'),
                BuildButton(onClick: () {}, text: '0'),
                BuildButton(onClick: () {}, text: '.'),
                BuildButton(onClick: () {}, text: "+", color: Colors.orangeAccent,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
