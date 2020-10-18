import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello/Global.dart';
import 'package:hello/model/photos.dart';
import 'package:http/http.dart' as http;

class wallpapers extends StatefulWidget {
  @override
  _wallpapersState createState() => _wallpapersState();
}

class _wallpapersState extends State<wallpapers> {

  getwallpaper() async {

   await http.get("https://api.pexels.com/v1/search?query=nature",
    headers: {"Authorization":"563492ad6f917000010000014cf4949fca7045f6b73fab576533a5da"}
    ).then((res){

      print(res.body);

      var parsedJson = jsonDecode(res.body);

      Global.photos=(parsedJson["photos"]as List).map((data)=>Photo.fromJson(data)).toList();


    });

    setState(() {
      
    });


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  getwallpaper();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
  title:  Text("WallpaperClub",
  style: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ), 
  
  
  ),
  elevation: 0.0,

),

      

      body: GridView.builder(

           itemCount:Global.photos.length,


        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio:0.5
        ),
        
        
        itemBuilder: (context,index){

          return  GestureDetector(onTap: (){

            Global.Index=index;


            Navigator.of(context).pushNamed('fullpage');




          },child: Container(decoration:BoxDecoration(
            color: Colors.white,

            
              image:DecorationImage(
              
              image: NetworkImage(Global.photos[index].src.tiny),fit: BoxFit.cover)


          ),),

          );
        }

      ),

      
    
    );
  }


}
