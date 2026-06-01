import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:practiceostad/screen/mediaQuary.dart';
import 'package:practiceostad/screen/note%20App.dart';
import 'package:practiceostad/screen/responsiv%20grid.dart';

import 'Calculator App/Ui.dart';
import 'Expanse Tracker/UI.dart';
import 'Water Tracker/ui.dart';

void main() => runApp(
  DevicePreview(
    enabled: false,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  expanse(),
    );
  }
}
