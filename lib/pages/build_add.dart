import 'package:flutter/material.dart';

import 'Weather_page.dart';
import 'note_app.dart';

class build_app extends StatelessWidget{
  const build_app({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
               children: [
                 const Text("Build Application",
                   style: TextStyle(
                     fontWeight: FontWeight.w500,
                     fontSize: 30,
                     color: Colors.red,
                     backgroundColor: Colors.yellow,
                 ),),
                 const Padding(padding: EdgeInsets.only(top: 30)),
                 OverflowBar(
                   overflowAlignment: OverflowBarAlignment.center,
                   overflowSpacing: 20,
                   children: [
                     MaterialButton(
                       minWidth: Material.defaultSplashRadius,
                       height: 40,
                       color: Colors.lightBlueAccent,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10),
                       ),
                       onPressed: (){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context) => note_app()));
                         // Navigator.push(context,
                         //     MaterialPageRoute(builder: (context) => const login_page()));
                       }, child: const Text("Notes app",style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 20,
                     ),),
                     ),
                     const Padding(padding: EdgeInsets.only(left: 30)),
                     MaterialButton(
                       minWidth: Material.defaultSplashRadius,
                       height: 40,
                       color: Colors.lightBlueAccent,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10),
                       ),
                       onPressed: (){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context) => weather_page()));
                         // Navigator.push(context,
                         //     MaterialPageRoute(builder: (context) => const login_page()));
                       }, child: const Text("Weather app",style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 20,
                     ),),
                     ),
                   ],
                 ),
               ]
            ),
          )
        ),
      )
    );
  }
}