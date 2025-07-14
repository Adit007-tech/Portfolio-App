import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/text.dart';

class tvShow extends StatelessWidget {
  final List tvshow;
  const tvShow({super.key, required this.tvshow});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedText(text: "Popular TV Shows  ✨"),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tvshow.length,
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
                                        image: NetworkImage("https://image.tmdb.org/t/p/w500" + tvshow[index]['poster_path']),
                                        fit: BoxFit.cover
                                    )
                                )
                            ),
                            Container(
                              child: Text(tvshow[index]['original_title'] ?? 'Loading',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
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
