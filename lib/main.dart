import 'package:flutter/material.dart';
import 'package:hello/pages/fullpage.dart';
import 'package:hello/pages/wallpapers.dart';

void main() {
  runApp(ConfigApp());
}

class ConfigApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.black,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Wallpapers(),
        'fullpage': (context) => FullPage(),
      },
    );
  }
}
