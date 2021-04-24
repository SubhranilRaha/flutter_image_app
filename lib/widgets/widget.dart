import 'package:flutter/material.dart';
import 'package:wallpaperhubapp/model/wallpaper_model.dart';

Widget brandName()
{
return Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('Wallpaper',style: TextStyle(color: Colors.black87),),
    Text('Hub',style: TextStyle(color: Colors.blue),)
  ],
);
}
Widget wallpapersList({ List<WallpaperModel>? wallpapers, context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
    childAspectRatio: 0.6,
    mainAxisSpacing: 6.0,
    crossAxisSpacing: 6.0,
    children: wallpapers!.map((wallpaper){
      return GridTile(
      child: Container(
        child: Image.network(wallpaper.src!.portrait!),
      ),
      );
  }).toList(),
  ),
  );
}