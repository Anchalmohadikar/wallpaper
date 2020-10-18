import 'package:flutter/material.dart';
import 'package:hello/Global.dart';

 class FullPage extends StatefulWidget {
   @override
   _FullPageState createState() => _FullPageState();
 }
 
 class _FullPageState extends State<FullPage> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Container(
         decoration: BoxDecoration(

           image: DecorationImage(image:NetworkImage(Global.photos[Global.Index].src.large2X),fit: BoxFit.cover)
           
           ),
         

        
       ),
       
     );
   }
 }
