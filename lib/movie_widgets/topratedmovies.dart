import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/text.dart';

class topratedMovies extends StatelessWidget {
  final List toprated;
  const topratedMovies({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedText(text: "Top Rated  Movies  ✨"),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            padding: EdgeInsets.all(10),
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toprated.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                    },
                    child: Container(
                        width: 150,
                        child: Column(
                          children: [
                            Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage("https://image.tmdb.org/t/p/w500" + toprated[index]['poster_path']),
                                        fit: BoxFit.cover
                                    )
                                )
                            ),
                            Container(
                              child: Text(toprated[index]['original_title'] ?? 'Loading',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                            )
                          ],
                        )
                    ),
                  );
                }),
          )

        ],
      ),
    );
  }
}
