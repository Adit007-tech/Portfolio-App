import 'package:flutter/material.dart';

// Show developer
class about_info extends StatelessWidget{
  const about_info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("About me",textAlign: TextAlign.center,style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,

        ),
        ),
      ),

    );
  }

}