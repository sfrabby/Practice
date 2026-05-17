import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  String text;
  Color? color;
  final VoidCallback onClick;
   BuildButton({
    super.key, required this.onClick,
     this.color, required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10),
            fixedSize: Size(40, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.grey[300],
          ),
          onPressed: onClick,
          child: Text(
            text,
            style: TextStyle(
              color: color ?? Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
