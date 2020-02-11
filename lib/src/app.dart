import 'dart:convert';

import 'package:albom_images/src/models/image_model.dart';
import 'package:albom_images/src/widgets/image_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images=[];
  void fetchImage() async{
    counter++;
    var result= await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel=ImageModel.fromJson(json.decode(result.body));
    setState(() {
      images.add(imageModel);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lets see some images!"),
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,

//              (){
//            setState(() {
//              counter++;
//            });
//          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
