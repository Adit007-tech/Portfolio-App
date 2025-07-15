import 'package:flutter/material.dart';
import 'package:moneycontrol/pages/wallPaper_page.dart';

import '../Authentication/auth_service.dart';
import 'Weather_page.dart';
import 'apiInteration.dart';
import 'chatGpt.dart';
import 'movie_page.dart';
import 'note_app.dart';

class build_app extends StatelessWidget {
  const build_app({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.deepPurpleAccent,
                Colors.redAccent,
              ],
            ),
          ),
          child: SingleChildScrollView(
              child: Center(
                child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20)),
                      const Text("Build Application",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.blue,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 30)),
                      SingleChildScrollView(
                        child: Column(
                            children: [
                              OverflowBar(
                                overflowAlignment: OverflowBarAlignment.center,
                                overflowSpacing: 30,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height * 0.07,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: MaterialButton(
                                      minWidth: Material.defaultSplashRadius,
                                      height: 40,
                                      color: Colors.lightBlueAccent[300],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) => note_app()));
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) => const login_page()));
                                      },
                                      child: const Text("Notes app",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // const Padding(
                                  //     padding: EdgeInsets.only(left: 30)),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height * 0.07,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: MaterialButton(
                                      minWidth: Material.defaultSplashRadius,
                                      height: 40,
                                      color: Colors.lightBlueAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) =>
                                                weather_page()));
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) => const login_page()));
                                      },
                                      child: const Text(
                                        "Weather app", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height * 0.07,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: MaterialButton(
                                      minWidth: Material.defaultSplashRadius,
                                      height: 40,
                                      color: Colors.lightBlueAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => apiIntegration()));
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) => const login_page()));
                                      },
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (context) => const login_page()));
                                      child: const Text("App Integration",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height * 0.07,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: MaterialButton(
                                      minWidth: Material.defaultSplashRadius,
                                      height: 40,
                                      color: Colors.lightBlueAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => wallPaper()));
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) => const login_page()));
                                      },
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (context) => const login_page()));
                                      child: const Text("WallPaper API",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height * 0.07,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: MaterialButton(
                                      minWidth: Material.defaultSplashRadius,
                                      height: 40,
                                      color: Colors.lightBlueAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => movieApi()));
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) => const login_page()));
                                      },
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (context) => const login_page()));
                                      child: const Text("Movie API",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height * 0.07,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: MaterialButton(
                                      minWidth: Material.defaultSplashRadius,
                                      height: 40,
                                      color: Colors.lightBlueAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onPressed: () async {
                                          bool check = await auth_service().authenticateLocally();
                                          if(check){
                                            Navigator.push(context,MaterialPageRoute(builder: (context) => chatGPT()));
                                          }
                                      },
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (context) => const login_page()));
                                      child: const Text("ChatGPT",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]

                        ),
                      ),
                    ]
                ),
              )
          ),
        )
    );
  }
}
