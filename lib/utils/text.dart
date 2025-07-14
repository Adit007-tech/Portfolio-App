import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modifiedText extends StatelessWidget {

  final String text;

  const modifiedText({super.key, required this.text});


  @override
  Widget build(BuildContext context) {
    return  Text(
      text, style: GoogleFonts.breeSerif(
      color: Colors.purple,fontSize: 30,
    )
    );
  }
}
