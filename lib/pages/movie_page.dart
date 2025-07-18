import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneycontrol/movie_widgets/trending.dart';
import 'package:moneycontrol/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../movie_widgets/topratedmovies.dart';
import '../movie_widgets/tvshow.dart';

class movieApi extends StatefulWidget{
  @override
  State<movieApi> createState() => _movieApiState();
}

class _movieApiState extends State<movieApi> {
  final String APIKEY = '2e2595d4ccfa3ae8d31eaca993001af2';
  final String readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZTI1OTVkNGNjZmEzYWU4ZDMxZWFjYTk5MzAwMWFmMiIsIm5iZiI6MTc1MjQwODQ5Mi4zODYsInN1YiI6IjY4NzNhMWFjYWY2YjUyODUwOGVkODFkNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0q00JiFhlgO1z_ksyqpjGS6c4PW7E8KqzuX2o1zTnkU';

  List trending = [];
  List toprated = [];
  List tv = [];

  @override
  void initState(){
    loadmovie();
    super.initState();
  }

  loadmovie() async{
    TMDB tmdbWithCustomLogs = TMDB(
        ApiKeys(APIKEY, readaccesstoken),
        logConfig: ConfigLogger(
            showLogs: true,
            showErrorLogs: true
        )
    );
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedmovies = await tmdbWithCustomLogs.v3.movies.getTopRated();;
    Map tvshow = await tmdbWithCustomLogs.v3.tv.getPopular();

    print(trendingresult);

    setState(() {
      trending = trendingresult['results'];
      toprated = topratedmovies['results'];
      tv = tvshow['results'];
    });

    // print(trendingresult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: modifiedText(text: "Movies API"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          children: [
            trendingMovies(trending: trending),
            topratedMovies(toprated: toprated),
            tvShow(tvshow: tv)
          ],
        )
    );
  }
}
