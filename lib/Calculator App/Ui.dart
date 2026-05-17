import 'package:flutter/material.dart';

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
        backgroundColor: Colors.black ,
        title:Text("calculator", style: TextStyle(color: Colors.white, fontSize: 25,  fontWeight: FontWeight.w700),) ,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight ,
              height: 250,
              width: double.infinity,
              child: Text("1234", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.grey
                ),
                onPressed: (){}, child: Text("1", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),))

          ],
        ),
      ),
    );
  }
}
