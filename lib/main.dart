import 'package:converter_app/converter_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: ConverterHome(),
    );
  }
}