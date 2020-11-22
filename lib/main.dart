import 'package:flutter/material.dart';
import 'package:hello/fullpage.dart';
import 'package:hello/wallpapers.dart';

void main() {
  runApp(ConfigApp());
}

class ConfigApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Wallpapers(),
        'fullpage': (context) => FullPage(),
      },
    );
  }
}
