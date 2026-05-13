import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class responsivGrid extends StatelessWidget {
  const responsivGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Responsiv Grid", style: TextStyle(color: Colors.white)),
      ),
      body: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(xl: 12, child: Container(color: Colors.green)),
        ],
      ),
    );
  }
}
