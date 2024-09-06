import 'package:flutter/material.dart';
import 'package:project_flutter/views/home_page.dart';

void main() {
  runApp( // roda o app
    MaterialApp( // estiliza
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.green,
      useMaterial3: false
    ),
      home: HomePage(), // rota inicial
    ),
  );
}