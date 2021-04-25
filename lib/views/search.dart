import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperhubapp/data/data.dart';

import 'package:wallpaperhubapp/model/wallpaper_model.dart';

import 'package:wallpaperhubapp/widgets/widget.dart';
import 'package:http/http.dart' as http;


class Search extends StatefulWidget {
  final String? searchQuery;
  Search({this.searchQuery});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  List<WallpaperModel> wallpapers = [];

  TextEditingController searchController = new TextEditingController();

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
    getSearchWallpapers(widget.searchQuery!);
    super.initState();
    searchController.text = widget.searchQuery!;
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
                wallpapersList(wallpapers: wallpapers, context: context)
                                      ]
                ,),),
      ),
    );
  }
}
