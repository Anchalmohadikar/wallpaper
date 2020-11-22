import 'package:flutter/material.dart';
import  'package:hello/Global.dart';

import 'Global.dart';

class FullPage extends StatefulWidget {
  @override
  _FullPageState createState() => _FullPageState();
}

class _FullPageState extends State<FullPage> {

PageController pageController = new PageController(initialPage: Global.Index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: Global.photos.length,
        itemBuilder: (context,index) {
          return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Global.photos[Global.Index].src.large2X),
                fit: BoxFit.cover)),
         );
      
        },
         ),
    );
  }
}
