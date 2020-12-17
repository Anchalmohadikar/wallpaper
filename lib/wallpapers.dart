import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hello/Global.dart';
import 'package:hello/data/data.dart';
import 'package:hello/model/categories.dart';
import 'package:hello/model/photos.dart';
import 'package:http/http.dart' as http;


class Wallpapers extends StatefulWidget {
  @override
  _WallpapersState createState() => _WallpapersState();
}

class _WallpapersState extends State<Wallpapers> {
  getwallpaper() async {
    await http.get("https://api.pexels.com/v1/search?query=nature", headers:  {
      "Authorization":
          "2efc3571549fc0e7282bf364453445ec79339cc7"

    }).then((res) {
      print(res.body);

      var parsedJson = jsonDecode(res.body);

      Global.photos = (parsedJson["photos"] as List)
          .map((data) => Photo.fromJson(data))
          .toList();
    });

    setState(() {});
  }
 List<Categorie> categorie= new List();
  @override
  void initState() {

    categorie= getCategories();
    // TODO: implement initState
    super.initState();
    getwallpaper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
         backgroundColor: Colors.transparent,
         

        title: Text(
          "WallpaperClub",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        actions:<Widget> [
          IconButton(
            icon: Icon(Icons.search,
            color:Colors.white),
            onPressed: (){
              //search
            },

            )
        ],
      ),
    

         drawer: Drawer(
           child: ListView(

        padding:EdgeInsets.zero,
        children:<Widget>[

          DrawerHeader(
            
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          
          
         child: Container(
              child:Column(
             children: <Widget>[


 
              
                Container(
                  decoration: BoxDecoration(
                    shape:BoxShape.circle,

            image:DecorationImage(
            image:NetworkImage('https://play-lh.googleusercontent.com/XDFSs2DHhEbLwovKULM51pZ2CQcWTLrK1aO1KONSn3DR65zbrZCJBAJZ_nGA5doYfhQ'),
          
            ),
                
              ),
              

          ),

           
            ],
                  
              ),
          ),
        
          ),

          ListTile(
            title: Text('wallpapers'),
            onTap: (){

            },



          ),

           ListTile(
            title: Text('Login'),
            onTap: (){

            },



          ),


          ListTile(

            title: Text('Register'),
            onTap: (){

              Navigator.pop(context);

            },
          ),
           ListTile(
            title: Text('Setting'),
            onTap: (){

            },



          ),

           ListTile(
            title: Text('Contact us'),
            onTap: (){

            },
),




        ]
),
      
    ),

     
               

   
      body: 

      Container(child: Column(
        children:<Widget> [
          SizedBox(height:16),
         
         Container(
           height: 70,
           child: ListView.builder(

            itemCount: categorie.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
return CategoriesTile(
  categorie: categorie[index].categorieName,
  imgUrls: categorie[index].imgUrl,

  
);
              
            }


          )

),
Container(child: 
      
          
GridView.builder(
        itemCount: Global.photos.length,
         scrollDirection: Axis.vertical,

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.5),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Global.Index = index;

              Navigator.of(context).pushNamed(
                'fullpage',
              );
            },
            
            
            
            
          child: Container(
              decoration: BoxDecoration(borderRadius:
                                                  BorderRadius.circular(
                                                20.0,
                                              ),

                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(
                    Global.photos[index].src.tiny,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),


          );
        },
      
      ),


        )






      
      ],),)
       );
    
  }
}
        
        

  
    
               
      


      

    

class CategoriesTile extends StatelessWidget {

  final String imgUrls , categorie;

  CategoriesTile({@required this.imgUrls,@required this.categorie});
  @override
  Widget build(BuildContext context) {
    return Container(child:Stack(children:<Widget> [


      Container(child: Image.network(imgUrls),
      )
    ],) 


    
    );
    
  }
}