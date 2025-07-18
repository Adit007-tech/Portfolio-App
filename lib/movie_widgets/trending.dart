import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../service/description_page.dart';
import '../utils/text.dart';

class trendingMovies extends StatelessWidget {
  final List trending;

  const trendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedText(text: "Trending Movies 📈 "),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DescriptionPage(
                                name: trending[index]['title'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' + trending[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path'],
                                description: trending[index]['overview'],
                                vote: trending[index]['vote_average'].toString(),
                                launch_on: trending[index]['release_date'],)
                            )
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: 250,
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage("https://image.tmdb.org/t/p/w500" + trending[index]['backdrop_path']),
                                  fit: BoxFit.cover
                                )
                              )
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Text(trending[index]['original_title'] ?? 'Loading',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
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
