import 'package:tmdb_api/tmdb_api.dart';

class fetchMovie{

  final String APIKEY = '2e2595d4ccfa3ae8d31eaca993001af2';

  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZTI1OTVkNGNjZmEzYWU4ZDMxZWFjYTk5MzAwMWFmMiIsIm5iZiI6MTc1MjQwODQ5Mi4zODYsInN1YiI6IjY4NzNhMWFjYWY2YjUyODUwOGVkODFkNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0q00JiFhlgO1z_ksyqpjGS6c4PW7E8KqzuX2o1zTnkU';

  loadmovie() async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(APIKEY, readaccesstoken,),
        logConfig: ConfigLogger(
            showLogs: true,
            showErrorLogs: true
        )
    );
    Map trending = await tmdbWithCustomLogs.v3.trending.getTrending();
    print(trending);
  }
}