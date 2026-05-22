import 'package:flutter/material.dart';

class ButtonAdd extends StatelessWidget {
  String text;
  final VoidCallback OnTap;

  ButtonAdd({super.key, required this.OnTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
          ),
          onPressed: OnTap,
          icon: Icon(Icons.water_drop, color: Colors.white, size: 30),
          label: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
