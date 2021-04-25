import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperhubapp/data/data.dart';
import 'package:wallpaperhubapp/model/wallpaper_model.dart';
import 'package:wallpaperhubapp/widgets/widget.dart';

class Categorie extends StatefulWidget {
  final String? categorieName;
  Categorie({this.categorieName});
  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<WallpaperModel> wallpapers = [];

  getSearchWallpapers(String query) async {

    Uri uri=Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=80&page=1');
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
    getSearchWallpapers(widget.categorieName!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Container(
            margin: EdgeInsets.fromLTRB(10, 10, 60, 10),
            child: Center(child: brandName())),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            SizedBox(height: 16,),
            wallpapersList(wallpapers: wallpapers, context: context)
          ]
            ,),),
      ),
    );
  }
}
