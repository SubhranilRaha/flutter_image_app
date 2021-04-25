import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';


class ImageView extends StatefulWidget {
  final String imgUrl;
  ImageView({required this.imgUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {

  var filePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(children: [
      Hero(
        tag: widget.imgUrl,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        child: Image.network(widget.imgUrl, fit: BoxFit.cover)),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: ()
              {
                _save();
                },
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width/2,
                    decoration: BoxDecoration(
                        color: Color(0xff1C1B1B).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  Container(
                    height: 50,
                  width: MediaQuery.of(context).size.width/2,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white60, width: 1),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(colors: [
                        Color(0x36FFFFFF),
                        Color(0x0FFFFFFF),
                      ]

                      )
                  ),

                  child: Column(children: [
                    Text('Get Image',style: TextStyle(
                        fontSize: 16, color: Colors.white)),
                    Text('Image will be saved in gallery', style: TextStyle(
                        fontSize: 10, color: Colors.white54
                    ),)
                  ],),
                ),],
              ),
            ),
            SizedBox(height: 16,)
          ],
        ),
      )
    ],),
    );
  }
  _save() async {
    var response =await Dio().get(
      widget.imgUrl,
      options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

}
