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
          ResponsiveGridCol(
            lg: 4,
            xs: 12,
            child: Container(
              padding: EdgeInsets.all(5),
              height: 100,
              color: Colors.green,
            ),
          ),
          ResponsiveGridCol(
            lg: 4,
            xs: 12,
            child: Container(
              padding: EdgeInsets.all(5),
              height: 100,
              color: Colors.redAccent,
            ),
          ),
          ResponsiveGridCol(
            lg: 4,
            xs: 12,
            child: Container(height: 100, color: Colors.teal),
          ),
          ResponsiveGridCol(
            lg: 4,
            xs: 12,
            child: Container(height: 100, color: Colors.orange),
          ),
          ResponsiveGridCol(
            lg: 4,
            xs: 12,
            child: Container(height: 100, color: Colors.purple),
          ),
        ],
      ),
    );
  }
}
