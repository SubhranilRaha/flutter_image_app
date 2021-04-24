import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperhubapp/data/data.dart';
import 'package:wallpaperhubapp/model/categories_model.dart';
import 'package:wallpaperhubapp/model/wallpaper_model.dart';
import 'package:wallpaperhubapp/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];
  List<WallpaperModel> wallpapers = [];

  getTrendingWallpapers() async {

    Uri uri=Uri.parse('https://api.pexels.com/v1/curated?per_page=15&page=1');
   var response =await http.get(uri,
   headers: {
     'authorization' : apiKey});
   //print(response.body.toString());
   Map<String,dynamic> jsonData = jsonDecode(response.body);
   jsonData['photos'].forEach((element){
     //print(element);
     WallpaperModel wallpaperModel =new WallpaperModel();
     wallpaperModel = WallpaperModel.fromMap(element);
     wallpapers.add(wallpaperModel);
    });
   setState(() {

   });
  }

  @override
  void initState() {
    getTrendingWallpapers();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30)
                ),
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "search wallpaper",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.search)
                ],
                ),
              ),
              SizedBox(height: 16,),
              Container(
                height: 80,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    itemCount:categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return CategoriesTile
                        (
                        title : categories[index].categoriesName,
                        imgUrl : categories[index].imgUrl,
                      );
                    }),
              ),
              SizedBox(height: 16,),
              wallpapersList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String? imgUrl, title;
  CategoriesTile({@required this.title,@required this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Stack(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(imgUrl!, height: 50, width: 100, fit: BoxFit.cover,)),
        Container(
          height: 50, width: 100,
          alignment: Alignment.center,
          child: Text(title!,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),)
      ],
      ),
    );
  }
}
