import 'package:flutter/material.dart';

class MediaQuary extends StatefulWidget {
  const MediaQuary({super.key});

  @override
  State<MediaQuary> createState() => _MediaQuaryState();
}

class _MediaQuaryState extends State<MediaQuary> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Media Query", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "স্ক্রিনের প্রস্থ (Width): ${screenWidth.toStringAsFixed(1)}",
              ),
            ),
            Center(child: Container(
              height: screenHeight*0.5,
              width: screenWidth*1,
              color: Colors.green,
              child: Container(
                height: screenHeight*0.3,
                width: screenWidth*0.2,

                decoration: BoxDecoration(
                    color: Colors.red,
                  borderRadius: BorderRadius.circular(300)
                ),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
