import 'package:flutter/material.dart';
import 'package:hello/fullpage.dart';
import 'package:hello/wallpapers.dart';



void main() {
  runApp(MaterialApp(
    home:  Myapp()
   ));
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primarySwatch: Colors.pink,

      ),
      home: wallpapers(),

      routes: {
        
        'fullpage':(context)=>FullPage()


      },
      


    );
      
    
  }
}
