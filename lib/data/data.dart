import 'package:hello/model/categories.dart';
import 'package:http/http.dart' as http;
import 'package:hello/model/photos.dart';
String apiKEY = "2efc3571549fc0e7282bf364453445ec79339cc7";

List<Categorie> getCategories()
{

  List<Categorie> categorie= new List();
  Categorie categories = new Categorie();

  //
  categories.imgUrl =
  "https://api.pexels.com/v1/search?query=nature";
  categories.categorieName ="All";
  categories.add(categorie);
  categories = new Categorie();


return categorie;


}  