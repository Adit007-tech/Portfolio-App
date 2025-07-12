import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moneycontrol/service/fullScreen.dart';

class wallPaper extends StatefulWidget{
  @override
  State<wallPaper> createState() => _wallPaperState();
}

class _wallPaperState extends State<wallPaper> {

  List images = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    fetchApi();
  }
  fetchApi() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),
        headers: {
          "Authorization": "ggfEIyB9LmnId0EwWwkmUh0uvrwEQGmzkrCA71Njc5MRozWByFWkQfLb"
        }).then((value) {
          Map result = jsonDecode(value.body);
          // print(result);
          setState(() {
            images = result["photos"];
          });
          // print(images);
        });
  }

  // load more wallPaper
  loadmore() async{
    setState(() {
      page++;
    });
    String url = "https://api.pexels.com/v1/curated?per_page=80&page="+page.toString();
    await http.get(Uri.parse(url),
        headers: {
          "Authorization": "ggfEIyB9LmnId0EwWwkmUh0uvrwEQGmzkrCA71Njc5MRozWByFWkQfLb"
        }).then((value) {
          Map result = jsonDecode(value.body);
          setState(() {
            images.addAll(result["photos"]);
          });
        });
    // print("load more");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wall Paper"),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
                child: Container(
                  child: GridView.builder(
                    itemCount: images.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 2,
                      crossAxisCount: 3,
                      childAspectRatio: 2/3,
                      mainAxisSpacing: 2), itemBuilder: (context ,index){
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => fullScreen(imageurl: images[index]["src"]["large2x"])));
                        },
                        child: Container(
                          color: Colors.black,
                          child: Image.network(
                            images[index]["src"]["tiny"],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                  }),
                )
            ),
            Container(
              color: Colors.black,
              height: 50,
              child: Center(
                  child: InkWell(
                    onTap: (){
                      loadmore();
                    },
                    child: Text("Load more",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white
                      ),
                    ),
                  )
              ),
            ),
            // Padding(padding: EdgeInsets.only(bottom: 20)),
          ],
        )
      ),
    );
  }
}