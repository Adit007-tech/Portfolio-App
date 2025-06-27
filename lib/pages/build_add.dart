import 'package:flutter/material.dart';

import 'note_app.dart';

class build_app extends StatelessWidget{
  const build_app({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                 ],
               ),
             ]
          ),
        )
      )
    );
  }
}